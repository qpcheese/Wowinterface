local _, addonTable = ...
local addon = addonTable.addon

local pairs = pairs

local _G = _G
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor
local GetChildren = GetChildren

function addon:SkinNineSliced(frame, color, desaturation)   
    for _, texture in pairs({
        frame.NineSlice.TopEdge,
        frame.NineSlice.BottomEdge,
        frame.NineSlice.TopRightCorner,
        frame.NineSlice.TopLeftCorner,
        frame.NineSlice.RightEdge,
        frame.NineSlice.LeftEdge,
        frame.NineSlice.BottomRightCorner,
        frame.NineSlice.BottomLeftCorner,  
    }) do
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color.r,color.g,color.b,color.a) 
    end
end

function addon:SkinTabs(frame, color)
    if frame.TabSystem then
        for _, tab in pairs({ frame.TabSystem:GetChildren() }) do 
            for _, texture in pairs({
                tab.Left,
                tab.Middle,
                tab.Right,
            }) do 
                texture:SetVertexColor(color.r,color.g,color.b,color.a) 
            end
        end
    else
        for _,texture in pairs({
            frame.Left,
            frame.Middle,
            frame.Right,
        })
        do  
            texture:SetVertexColor(color.r,color.g,color.b,color.a) 
        end
    end
end

function addon:SkinScrollBar(frame, color)
    for _, texture in pairs({
        frame.ScrollBar.Track.Thumb.Begin,
        frame.ScrollBar.Track.Thumb.Middle,
        frame.ScrollBar.Track.Thumb.End,
        frame.ScrollBar.Back.Texture,
        frame.ScrollBar.Forward.Texture,
    }) do
        texture:SetVertexColor(color.r,color.g,color.b,color.a) 
    end
end

function addon:SkinTextures(frame, color)
    for _, texture in pairs({
        _G[frame.."TopLeftTexture"],
        _G[frame.."TopTexture"],
        _G[frame.."TopRightTexture"],
        _G[frame.."RightTexture"],
        _G[frame.."BottomRightTexture"],
        _G[frame.."BottomTexture"],
        _G[frame.."BottomLeftTexture"],
        _G[frame.."LeftTexture"],
    }) do 
        texture:SetVertexColor(color.r,color.g,color.b) 
    end
end

function addon:SkinEdges(frame, color)
    for _, texture in pairs({
        frame.TopEdge,
        frame.TopRightCorner,
        frame.RightEdge,
        frame.BottomRightCorner,
        frame.BottomEdge,
        frame.BottomLeftCorner,
        frame.LeftEdge,
        frame.TopLeftCorner,
    }) do 
        texture:SetVertexColor(color.r,color.g,color.b)
    end
end

function addon:SkinBorders(frame, color)
    for _, texture in pairs({
        frame.BorderTopMiddle,
        frame.BorderTopRight,
        frame.BorderRightMiddle,
        frame.BorderBottomRight,
        frame.BorderBottomMiddle,
        frame.BorderBottomLeft,
        frame.BorderLeftMiddle,
        frame.BorderTopLeft,
        frame.LeftBorder,
        frame.BottomLeftBorder,
        frame.BottomBorder,
        frame.BottomRightBorder,
        frame.RightBorder,
    }) do 
        texture:SetVertexColor(color.r,color.g,color.b)
    end
end