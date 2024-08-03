local addonName, _EchoRaidTools = ...;
local _ExposedInternal = _EchoRaidTools:GetModule("ExposedInternal")

function _ExposedInternal:ExposeNoteParsing()

    local function trim(s)
        local from = s:match("^%s*()");
        return from > #s and "" or s:match(".*%S", from);
    end

    local function findCharacters(text,chars)
        for i=1,#text do
            if(chars[text:sub(i,i)])then
                return i;
            end
        end
    end

    local function findCharacter(text,char)
        for i=1,#text do
            if(char == text:sub(i,i))then
                return i;
            end
        end
    end

    local function findString(text,search)
        local searchLen = #search;
        for i=1,#text-searchLen+1 do
            if(text:sub(i,i+searchLen-1) == search)then
                return i + searchLen;
            end
        end
    end

    local whitespaceChars =
    {
        ["\n"] = true,
        ["\t"] = true,
        ["\r"] = true,
        [" "] = true,
    };

    local function findWhitespace(text)
        return findCharacters(text,whitespaceChars);
    end

    local errorString,skipIsValid;
    local function reportError(...)
        errorString = (tostringall(...)):gsub("|(%a)", "||%1"):gsub("|$", "||");
    end

    local function isErrorReported()
        return errorString ~= nil;
    end

    local function parseIdentifier(text,ret)
        local identEnd = findWhitespace(text);
        ret.identifier = text:sub(2,identEnd-1);
        return identEnd;
    end

    local function parsePlayer(text,ret)
        local playerEnd = findString(text,"|r");
        if(not playerEnd)then
            reportError("Malformed player input. Expected '|r', parse input: `"..text.."`.");
            return nil,0;
        end

        local playerSearch = string.sub(text,1,playerEnd);
        local player = string.match(playerSearch,"|c%x%x%x%x%x%x%x%x(.-)||r");

        if(not player)then
            reportError("Invalid player escape for `"..playerSearch.."`.");
            return nil,0;
        end

        if(player == "-SKIP-")then
            player = "SKIP";
        elseif(not skipIsValid)then
            if(not UnitExists(player))then
                reportError("Player "..player.." not in raid.");
                return nil,0;
            end

            if(not UnitIsConnected(player))then
                reportError("Player "..player.." not online.");
                return nil,0;
            end
        end

        return player,playerEnd-1;
    end

    local function parseMarker(text,ret)
        local markerEnd = findCharacter(text,"}");
        if(not markerEnd)then
            reportError("Malformed marker input. Expected '}', parse input: `"..text.."`.");
            return 0;
        end

        local markerInput = text:sub(1,markerEnd);
        local marker = _EchoRaidTools.fakeInternal:GetTargetMarkerFromString(markerInput);
        if(not marker)then
            reportError("Invalid marker specified: `"..markerInput.."`.");
            return 0;
        end

        ret.marker = marker;
        return markerEnd;
    end

    local function parseRotationGroup(text,ret)
        local groupEnd = findCharacter(text,"]");

        if(not groupEnd)then
            reportError("Malformed group input. Expected ']', parse input: `"..text.."`.");
            return 0;
        end

        local fullGroup = string.sub(text,1,groupEnd);

        local i = 1;
        local players = {};
        while(i<=#fullGroup)do
            local char = fullGroup:sub(i,i);
            if(char == "\124")then
                local player, size = parsePlayer(string.sub(fullGroup,i));

                if(isErrorReported())then
                    return 0;
                end

                table.insert(players,player);
                i = i + size;
            else
                i = i + 1;
            end
        end

        table.insert(ret.rotation, players);

        return #fullGroup;
    end

    local function parseSingleLine(note,ret)
        note = trim(note);
        if(note:sub(1,1) == "#")then

            local parseResult = {};
            parseResult.rotation = {};

            local i = parseIdentifier(note,parseResult);

            while(i<=#note)do

                local char = note:sub(i,i);
                local forward = nil;
                if(char == "\124")then
                    local player, size = parsePlayer(string.sub(note,i));

                    if(isErrorReported())then
                        return;
                    end

                    if(note:sub(i-1,i-1) ~= "!")then
                        table.insert(parseResult.rotation, {player});
                    end

                    forward = size;
                elseif(char == "{")then
                    forward = parseMarker(string.sub(note,i),parseResult);
                elseif(char == "[")then
                    forward = parseRotationGroup(string.sub(note,i),parseResult);
                else
                    forward = 1;
                end

                if(isErrorReported())then
                    return;
                end

                i = i + forward;
            end

            table.insert(ret,parseResult);
        end
    end

    local function readNote(note,skipValidCheck)
        local ret = {};
        errorString = nil;
        skipIsValid = skipValidCheck;

        local noteLines = {strsplit("\n",note)};
        for _,line in ipairs(noteLines) do
            if(not isErrorReported())then
                parseSingleLine(line,ret);
            end
        end

        return ret,errorString;
    end

    -------------------------------------------------------------------------------------------------------------------------------------------------

    function _EchoRaidTools.fakeInternal:ReadNote(note,skipValidCheck)
        return note and readNote(note,skipValidCheck);
    end

    -- luacheck: push globals VExRT
    function _EchoRaidTools.fakeInternal:ReadEXRTNote(skipValidCheck)
        local noteText = VExRT and VExRT.Note.Text1;
        if(noteText)then
            return readNote(noteText,skipValidCheck);
        else
            return nil, "ERT not loaded.";
        end
    end
    -- luacheck: pop
end