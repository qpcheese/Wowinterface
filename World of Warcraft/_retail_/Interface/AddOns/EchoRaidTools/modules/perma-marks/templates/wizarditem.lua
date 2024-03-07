local mixin = {}

function mixin:EnableSnapBack(value)
    self.snapBack = value
end

function mixin:SetData(type, value, backgroundColor, displayText)
    self.type = type
    self.value = value
    self.backgroundColor = backgroundColor
    self.displayText = displayText

    self.Bg:SetVertexColor(backgroundColor.r, backgroundColor.g, backgroundColor.b, 1)
    self.Text:SetText(displayText)
end

function mixin:OnLoad()
    self:RegisterForDrag("LeftButton")
end

function mixin:OnDragStart()
    print("Dragging")
    -- Store old position
    if self.snapBack then
        self.oldPoints = {}
        for i=1, self:GetNumPoints() do
            local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint(i)
            table.insert(self.oldPoints, {point, relativeTo, relativePoint, xOfs, yOfs})
        end
    end

    self:StartMoving()
end

function mixin:OnDragStop()
    print("Dropping")
    self:StopMovingOrSizing()
    if self.snapBack then
        self:ClearAllPoints()
        for _, point in ipairs(self.oldPoints) do
            self:SetPoint(unpack(point))
        end
    end
end

function mixin:OnClick()
    print("Clicked")
end

EchoRaidTools_PermaMarks_WizardItem_Mixin = mixin

