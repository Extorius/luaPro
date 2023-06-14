assert(_G, "Missing _G global")
assert(_G.Settings, "Please provide valid settings.")

if _G.LPRM then
    print("Already loaded luaPro HTTP Spy.")
    return
end

_G.LPRM = true

-- Instances:
local Converted = {
    ["_ScreenGui"] = Instance.new("ScreenGui"),
    ["_Frame"] = Instance.new("Frame"),
    ["_UICorner"] = Instance.new("UICorner"),
    ["_UIStroke"] = Instance.new("UIStroke"),
    ["_Name"] = Instance.new("TextLabel"),
    ["_Content"] = Instance.new("ScrollingFrame"),
    ["_Frame1"] = Instance.new("Frame"),
    ["_UICorner1"] = Instance.new("UICorner"),
    ["_Info"] = Instance.new("TextLabel"),
    ["_Blocked"] = Instance.new("TextLabel"),
    ["_Detail1"] = Instance.new("Folder"),
    ["_ImageButton"] = Instance.new("ImageButton"),
    ["_Label"] = Instance.new("TextLabel"),
    ["_Detail2"] = Instance.new("Folder"),
    ["_Label1"] = Instance.new("TextLabel"),
    ["_ImageButton1"] = Instance.new("ImageButton"),
    ["_Frame2"] = Instance.new("Frame"),
    ["_UICorner2"] = Instance.new("UICorner"),
    ["_Info1"] = Instance.new("TextLabel"),
    ["_Blocked1"] = Instance.new("TextLabel"),
    ["_Detail11"] = Instance.new("Folder"),
    ["_ImageButton2"] = Instance.new("ImageButton"),
    ["_Label2"] = Instance.new("TextLabel"),
    ["_Detail21"] = Instance.new("Folder"),
    ["_Label3"] = Instance.new("TextLabel"),
    ["_ImageButton3"] = Instance.new("ImageButton"),
    ["_UIGridLayout"] = Instance.new("UIGridLayout")
}

-- Properties:

Converted["_ScreenGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_ScreenGui"].Parent = game:GetService("CoreGui")

Converted["_Frame"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(34.00000177323818, 34.00000177323818, 34.00000177323818)
Converted["_Frame"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Frame"].Size = UDim2.new(0, 500, 0, 300)
Converted["_Frame"].Parent = Converted["_ScreenGui"]

Converted["_UICorner"].Parent = Converted["_Frame"]

Converted["_UIStroke"].Color = Color3.fromRGB(72.00000330805779, 72.00000330805779, 72.00000330805779)
Converted["_UIStroke"].Thickness = 2
Converted["_UIStroke"].Parent = Converted["_Frame"]

Converted["_Name"].Font = Enum.Font.GothamBold
Converted["_Name"].Text = "luaPro HTTP Spy"
Converted["_Name"].TextColor3 = Color3.fromRGB(221.00001722574234, 221.00001722574234, 221.00001722574234)
Converted["_Name"].TextSize = 18
Converted["_Name"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Name"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Name"].BackgroundTransparency = 1
Converted["_Name"].Position = UDim2.new(0.0280000009, 0, 0.0599999987, 0)
Converted["_Name"].Size = UDim2.new(0, 129, 0, 18)
Converted["_Name"].Name = "Name"
Converted["_Name"].Parent = Converted["_Frame"]

Converted["_Content"].ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Content"].Active = true
Converted["_Content"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Content"].BackgroundTransparency = 1
Converted["_Content"].Position = UDim2.new(0.0280000009, 0, 0.146666661, 0)
Converted["_Content"].Size = UDim2.new(0, 464, 0, 241)
Converted["_Content"].Name = "Content"
Converted["_Content"].Parent = Converted["_Frame"]
Converted["_Content"].ScrollBarThickness = 0
Converted["_Content"].CanvasSize = UDim2.new(0, 0, 100000, 0)

Converted["_ImageButton3"].Image = "rbxassetid://13739190982"
Converted["_ImageButton3"].ImageColor3 = Color3.fromRGB(141.0000067949295, 141.0000067949295, 141.0000067949295)
Converted["_ImageButton3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ImageButton3"].BackgroundTransparency = 1
Converted["_ImageButton3"].Position = UDim2.new(0.693333328, 0, 0.729999959, 0)
Converted["_ImageButton3"].Size = UDim2.new(0, 20, 0, 20)
Converted["_ImageButton3"].Parent = Converted["_Detail21"]

Converted["_UIGridLayout"].CellPadding = UDim2.new(0, 10, 0, 10)
Converted["_UIGridLayout"].CellSize = UDim2.new(0, 300, 0, 100)
Converted["_UIGridLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIGridLayout"].Parent = Converted["_Content"]

local dragToggle = nil
local dragSpeed = .25
local dragInput = nil
local dragStart = nil
local dragPos = nil
local startPos = Converted["_Frame"].Position

local function updateInput(input)
    local Delta = input.Position - dragStart
    local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale,
        startPos.Y.Offset + Delta.Y)
    game:GetService("TweenService"):Create(Converted["_Frame"], TweenInfo.new(.25), {
        Position = Position
    }):Play()
end

Converted["_Frame"].InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        dragToggle = true
        dragStart = input.Position
        startPos = Converted["_Frame"].Position
        input.Changed:Connect(function()
            if (input.UserInputState == Enum.UserInputState.End) then
                dragToggle = false
            end
        end)
    end
end)

Converted["_Frame"].InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if (input == dragInput and dragToggle) then
        updateInput(input)
    end
end)

local function AddFrame(URL, Post, Receive, Blocked)
    local Converted2 = {
        ["_Frame"] = Instance.new("Frame"),
        ["_UICorner"] = Instance.new("UICorner"),
        ["_Info"] = Instance.new("TextLabel"),
        ["_Blocked"] = Instance.new("TextLabel"),
        ["_Detail1"] = Instance.new("Folder"),
        ["_ImageButton"] = Instance.new("ImageButton"),
        ["_Label"] = Instance.new("TextLabel"),
        ["_Detail2"] = Instance.new("Folder"),
        ["_Label1"] = Instance.new("TextLabel"),
        ["_ImageButton1"] = Instance.new("ImageButton")
    }

    -- Properties:

    Converted2["_Frame"].BackgroundColor3 = Color3.fromRGB(44.000001177191734, 44.000001177191734, 44.000001177191734)
    Converted2["_Frame"].Position = UDim2.new(0.0495517217, 0, 0.151666671, 0)
    Converted2["_Frame"].Size = UDim2.new(0, 300, 0, 100)
    Converted2["_Frame"].Parent = Converted["_ScreenGui"].Frame.Content

    Converted2["_UICorner"].Parent = Converted2["_Frame"]

    Converted2["_Info"].Font = Enum.Font.Gotham
    Converted2["_Info"].Text = "URL: " .. URL
    Converted2["_Info"].TextColor3 = Color3.fromRGB(225.00001698732376, 225.00001698732376, 225.00001698732376)
    Converted2["_Info"].TextSize = 14
    Converted2["_Info"].TextXAlignment = Enum.TextXAlignment.Left
    Converted2["_Info"].AnchorPoint = Vector2.new(0.5, 0.5)
    Converted2["_Info"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted2["_Info"].BackgroundTransparency = 1
    Converted2["_Info"].Position = UDim2.new(0.263333321, 0, 0.120000005, 0)
    Converted2["_Info"].Size = UDim2.new(0, 141, 0, 25)
    Converted2["_Info"].Name = "URL"
    Converted2["_Info"].Parent = Converted2["_Frame"]

    Converted2["_Blocked"].Font = Enum.Font.Gotham
    Converted2["_Blocked"].Text = Blocked
    Converted2["_Blocked"].TextColor3 = Color3.fromRGB(225.00001698732376, 225.00001698732376, 225.00001698732376)
    Converted2["_Blocked"].TextSize = 14
    Converted2["_Blocked"].TextXAlignment = Enum.TextXAlignment.Left
    Converted2["_Blocked"].AnchorPoint = Vector2.new(0.5, 0.5)
    Converted2["_Blocked"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted2["_Blocked"].BackgroundTransparency = 1
    Converted2["_Blocked"].Position = UDim2.new(0.513333321, 0, 0.370000005, 0)
    Converted2["_Blocked"].Size = UDim2.new(0, 291, 0, 25)
    Converted2["_Blocked"].Name = "Blocked"
    Converted2["_Blocked"].Parent = Converted2["_Frame"]

    Converted2["_Detail1"].Name = "POST"
    Converted2["_Detail1"].Parent = Converted2["_Frame"]

    Converted2["_ImageButton"].Image = "rbxassetid://13739190982"
    Converted2["_ImageButton"].ImageColor3 = Color3.fromRGB(141.0000067949295, 141.0000067949295, 141.0000067949295)
    Converted2["_ImageButton"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted2["_ImageButton"].BackgroundTransparency = 1
    Converted2["_ImageButton"].Position = UDim2.new(0.693333328, 0, 0.529999971, 0)
    Converted2["_ImageButton"].Size = UDim2.new(0, 20, 0, 20)
    Converted2["_ImageButton"].Parent = Converted2["_Detail1"]

    Converted2["_ImageButton"].MouseButton1Click:Connect(function()
        local Copy = setclipboard or copyclipboard or print
        Copy(Post)
    end)

    Converted2["_Label"].Font = Enum.Font.Gotham
    Converted2["_Label"].Text = "Request Sent"
    Converted2["_Label"].TextColor3 = Color3.fromRGB(172.00000494718552, 172.00000494718552, 172.00000494718552)
    Converted2["_Label"].TextSize = 14
    Converted2["_Label"].TextXAlignment = Enum.TextXAlignment.Left
    Converted2["_Label"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted2["_Label"].BackgroundTransparency = 1
    Converted2["_Label"].Position = UDim2.new(0.0266666673, 0, 0.560000002, 0)
    Converted2["_Label"].Size = UDim2.new(0, 200, 0, 14)
    Converted2["_Label"].Name = "Label"
    Converted2["_Label"].Parent = Converted2["_Detail1"]

    Converted2["_Detail2"].Name = "Detail2"
    Converted2["_Detail2"].Parent = Converted2["_Frame"]

    Converted2["_Label1"].Font = Enum.Font.Gotham
    Converted2["_Label1"].Text = "Request Receive"
    Converted2["_Label1"].TextColor3 = Color3.fromRGB(172.00000494718552, 172.00000494718552, 172.00000494718552)
    Converted2["_Label1"].TextSize = 14
    Converted2["_Label1"].TextXAlignment = Enum.TextXAlignment.Left
    Converted2["_Label1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted2["_Label1"].BackgroundTransparency = 1
    Converted2["_Label1"].Position = UDim2.new(0.0266666673, 0, 0.75999999, 0)
    Converted2["_Label1"].Size = UDim2.new(0, 200, 0, 14)
    Converted2["_Label1"].Name = "Label"
    Converted2["_Label1"].Parent = Converted2["_Detail2"]

    Converted2["_ImageButton1"].Image = "rbxassetid://13739190982"
    Converted2["_ImageButton1"].ImageColor3 = Color3.fromRGB(141.0000067949295, 141.0000067949295, 141.0000067949295)
    Converted2["_ImageButton1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Converted2["_ImageButton1"].BackgroundTransparency = 1
    Converted2["_ImageButton1"].Position = UDim2.new(0.693333328, 0, 0.729999959, 0)
    Converted2["_ImageButton1"].Size = UDim2.new(0, 20, 0, 20)
    Converted2["_ImageButton1"].Parent = Converted2["_Detail2"]

    Converted2["_ImageButton1"].MouseButton1Click:Connect(function()
        local Copy = setclipboard or copyclipboard or print
        Copy(Receive)
    end)
end

local t = {} -- roblox's old JSON parser, can't really be hooked by anti http spies

local StringBuilder = {
    buffer = {}
}

function StringBuilder:New()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.buffer = {}
    return o
end

function StringBuilder:Append(s)
    self.buffer[#self.buffer + 1] = s
end

function StringBuilder:ToString()
    return table.concat(self.buffer)
end

local JsonWriter = {
    backslashes = {
        ['\b'] = "\\b",
        ['\t'] = "\\t",
        ['\n'] = "\\n",
        ['\f'] = "\\f",
        ['\r'] = "\\r",
        ['"'] = "\\\"",
        ['\\'] = "\\\\",
        ['/'] = "\\/"
    }
}

function JsonWriter:New()
    local o = {}
    o.writer = StringBuilder:New()
    setmetatable(o, self)
    self.__index = self
    return o
end

function JsonWriter:Append(s)
    self.writer:Append(s)
end

function JsonWriter:ToString()
    return self.writer:ToString()
end

function JsonWriter:Write(o)
    local t = type(o)
    if t == "nil" then
        self:WriteNil()
    elseif t == "boolean" then
        self:WriteString(o)
    elseif t == "number" then
        self:WriteString(o)
    elseif t == "string" then
        self:ParseString(o)
    elseif t == "table" then
        self:WriteTable(o)
    elseif t == "function" then
        self:WriteFunction(o)
    elseif t == "thread" then
        self:WriteError(o)
    elseif t == "userdata" then
        self:WriteError(o)
    end
end

function JsonWriter:WriteNil()
    self:Append("null")
end

function JsonWriter:WriteString(o)
    self:Append(tostring(o))
end

function JsonWriter:ParseString(s)
    self:Append('"')
    self:Append(string.gsub(s, "[%z%c\\\"/]", function(n)
        local c = self.backslashes[n]
        if c then
            return c
        end
        return string.format("\\u%.4X", string.byte(n))
    end))
    self:Append('"')
end

function JsonWriter:IsArray(t)
    local count = 0
    local isindex = function(k)
        if type(k) == "number" and k > 0 then
            if math.floor(k) == k then
                return true
            end
        end
        return false
    end
    for k, v in pairs(t) do
        if not isindex(k) then
            return false, '{', '}'
        else
            count = math.max(count, k)
        end
    end
    return true, '[', ']', count
end

function JsonWriter:WriteTable(t)
    local ba, st, et, n = self:IsArray(t)
    self:Append(st)
    if ba then
        for i = 1, n do
            self:Write(t[i])
            if i < n then
                self:Append(',')
            end
        end
    else
        local first = true;
        for k, v in pairs(t) do
            if not first then
                self:Append(',')
            end
            first = false;
            self:ParseString(k)
            self:Append(':')
            self:Write(v)
        end
    end
    self:Append(et)
end

function JsonWriter:WriteError(o)
    error(string.format("Encoding of %s unsupported", tostring(o)))
end

function JsonWriter:WriteFunction(o)
    if o == Null then
        self:WriteNil()
    else
        self:WriteError(o)
    end
end

local StringReader = {
    s = "",
    i = 0
}

function StringReader:New(s)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.s = s or o.s
    return o
end

function StringReader:Peek()
    local i = self.i + 1
    if i <= #self.s then
        return string.sub(self.s, i, i)
    end
    return nil
end

function StringReader:Next()
    self.i = self.i + 1
    if self.i <= #self.s then
        return string.sub(self.s, self.i, self.i)
    end
    return nil
end

function StringReader:All()
    return self.s
end

local JsonReader = {
    escapes = {
        ['t'] = '\t',
        ['n'] = '\n',
        ['f'] = '\f',
        ['r'] = '\r',
        ['b'] = '\b'
    }
}

function JsonReader:New(s)
    local o = {}
    o.reader = StringReader:New(s)
    setmetatable(o, self)
    self.__index = self
    return o;
end

function JsonReader:Read()
    self:SkipWhiteSpace()
    local peek = self:Peek()
    if peek == nil then
        error(string.format("Nil string: '%s'", self:All()))
    elseif peek == '{' then
        return self:ReadObject()
    elseif peek == '[' then
        return self:ReadArray()
    elseif peek == '"' then
        return self:ReadString()
    elseif string.find(peek, "[%+%-%d]") then
        return self:ReadNumber()
    elseif peek == 't' then
        return self:ReadTrue()
    elseif peek == 'f' then
        return self:ReadFalse()
    elseif peek == 'n' then
        return self:ReadNull()
    elseif peek == '/' then
        self:ReadComment()
        return self:Read()
    else
        return nil
    end
end

function JsonReader:ReadTrue()
    self:TestReservedWord{'t', 'r', 'u', 'e'}
    return true
end

function JsonReader:ReadFalse()
    self:TestReservedWord{'f', 'a', 'l', 's', 'e'}
    return false
end

function JsonReader:ReadNull()
    self:TestReservedWord{'n', 'u', 'l', 'l'}
    return nil
end

function JsonReader:TestReservedWord(t)
    for i, v in ipairs(t) do
        if self:Next() ~= v then
            error(string.format("Error reading '%s': %s", table.concat(t), self:All()))
        end
    end
end

function JsonReader:ReadNumber()
    local result = self:Next()
    local peek = self:Peek()
    while peek ~= nil and string.find(peek, "[%+%-%d%.eE]") do
        result = result .. self:Next()
        peek = self:Peek()
    end
    result = tonumber(result)
    if result == nil then
        error(string.format("Invalid number: '%s'", result))
    else
        return result
    end
end

function JsonReader:ReadString()
    local result = ""
    assert(self:Next() == '"')
    while self:Peek() ~= '"' do
        local ch = self:Next()
        if ch == '\\' then
            ch = self:Next()
            if self.escapes[ch] then
                ch = self.escapes[ch]
            end
        end
        result = result .. ch
    end
    assert(self:Next() == '"')
    local fromunicode = function(m)
        return string.char(tonumber(m, 16))
    end
    return string.gsub(result, "u%x%x(%x%x)", fromunicode)
end

function JsonReader:ReadComment()
    assert(self:Next() == '/')
    local second = self:Next()
    if second == '/' then
        self:ReadSingleLineComment()
    elseif second == '*' then
        self:ReadBlockComment()
    else
        error(string.format("Invalid comment: %s", self:All()))
    end
end

function JsonReader:ReadBlockComment()
    local done = false
    while not done do
        local ch = self:Next()
        if ch == '*' and self:Peek() == '/' then
            done = true
        end
        if not done and ch == '/' and self:Peek() == "*" then
            error(string.format("Invalid comment: %s, '/*' illegal.", self:All()))
        end
    end
    self:Next()
end

function JsonReader:ReadSingleLineComment()
    local ch = self:Next()
    while ch ~= '\r' and ch ~= '\n' do
        ch = self:Next()
    end
end

function JsonReader:ReadArray()
    local result = {}
    assert(self:Next() == '[')
    local done = false
    if self:Peek() == ']' then
        done = true;
    end
    while not done do
        local item = self:Read()
        result[#result + 1] = item
        self:SkipWhiteSpace()
        if self:Peek() == ']' then
            done = true
        end
        if not done then
            local ch = self:Next()
            if ch ~= ',' then
                error(string.format("Invalid array: '%s' due to: '%s'", self:All(), ch))
            end
        end
    end
    assert(']' == self:Next())
    return result
end

function JsonReader:ReadObject()
    local result = {}
    assert(self:Next() == '{')
    local done = false
    if self:Peek() == '}' then
        done = true
    end
    while not done do
        local key = self:Read()
        if type(key) ~= "string" then
            error(string.format("Invalid non-string object key: %s", key))
        end
        self:SkipWhiteSpace()
        local ch = self:Next()
        if ch ~= ':' then
            error(string.format("Invalid object: '%s' due to: '%s'", self:All(), ch))
        end
        self:SkipWhiteSpace()
        local val = self:Read()
        result[key] = val
        self:SkipWhiteSpace()
        if self:Peek() == '}' then
            done = true
        end
        if not done then
            ch = self:Next()
            if ch ~= ',' then
                error(string.format("Invalid array: '%s' near: '%s'", self:All(), ch))
            end
        end
    end
    assert(self:Next() == "}")
    return result
end

function JsonReader:SkipWhiteSpace()
    local p = self:Peek()
    while p ~= nil and string.find(p, "[%s/]") do
        if p == '/' then
            self:ReadComment()
        else
            self:Next()
        end
        p = self:Peek()
    end
end

function JsonReader:Peek()
    return self.reader:Peek()
end

function JsonReader:Next()
    return self.reader:Next()
end

function JsonReader:All()
    return self.reader:All()
end

function Encode(o)
    local writer = JsonWriter:New()
    writer:Write(o)
    return writer:ToString()
end

function Decode(s)
    local reader = JsonReader:New(s)
    return reader:Read()
end

t.DecodeJSON = function(jsonString)
    if type(jsonString) == "string" then
        return Decode(jsonString)
    end
end

t.EncodeJSON = function(jsonTable)
    return Encode(jsonTable)
end

local function Serialize(Data) -- slightly skidded serializer from a remote spy I found
    local Result = "{"

    local Success, Response = pcall(function()
        for i, v in pairs(Data or {}) do
            local Iterator = "[" .. (type(i) == "string" and "'" or "") .. tostring(i) ..
                                 (type(i) == "string" and "'" or "") .. "]="
            if type(v) == "number" then
                Result = Result .. Iterator .. tostring(v)
                if i ~= #Data then
                    Result = Result .. ","
                else
                    Result = Result .. ""
                end
            elseif type(v) == "string" then
                if (v:match("'") and not v:match('"')) or not (v:match("'") and not v:match('"')) then
                    Result = Result .. Iterator .. '"' .. v .. '"'
                elseif v:match('"') and not v:match("'") then
                    Result = Result .. Iterator .. "'" .. v .. "'"
                else
                    Result = Result .. Iterator .. "[[" .. v .. "]]"
                end

                if i ~= #Data then
                    Result = Result .. ","
                else
                    Result = Result .. ""
                end
            elseif type(v) == "table" then
                Result = Result .. Iterator .. Serialize(v)
                if i ~= #Data then
                    Result = Result .. ","
                else
                    Result = Result .. ""
                end
            end
        end
    end)

    if Success then
        return Result .. "}"
    else
        return "Internal Error: [" .. Response .. "]"
    end
end

local RequestFunctions = {
    ["synapse"] = (syn and syn.request),
    ["unc1"] = (http and http.request),
    ["unc2"] = http_request,
    ["unc3"] = request
}
local IdentifiedExecutor = nil

if RequestFunctions["synapase"] and not RequestFunctions["unc1"] and not RequestFunctions["unc2"] and
    not RequestFunctions["unc3"] then
    IdentifiedExecutor = "Synapse X"
elseif RequestFunctions["unc1"] and not RequestFunctions["unc2"] and not RequestFunctions["unc3"] then
    IdentifiedExecutor = "Script-Ware"
elseif RequestFunctions["unc1"] or RequestFunctions["unc2"] or RequestFunctions["unc3"] then
    IdentifiedExecutor = "UWP Executor"
end

local ExecutorName, ExecutorVersion = identifyexecutor()
if not ExecutorVersion or ExecutorVersion == ExecutorName then
    ExecutorVersion = 0
end

assert(IdentifiedExecutor, "Unsupported executor?: Missing / Mismatching Request Function(s)")
print("Identified executor:", IdentifiedExecutor)

if _G.Settings.RemoveSecurity then
    local OldFind
    OldFind = hookfunction(table.find, newcclosure(function(...) -- works around and possibly disables anti hooks that create a table of blacklisted functions and check if the hooked function is in that table
        local Args = {...}
        if not Args or not Args[1] then
            OldFind(...)
        end

        if not Args[2] then
            OldFind(...)
        end

        if OldFind(RequestFunctions, Args[2]) then
            local S, R = pcall(function()
                table.clear(Args[1])
            end)

            return false
        end

        return OldFind(...)
    end))

    local OldNCM
    OldNCM = hookfunction(getnamecallmethod, function(...) -- prevents metamethod detections that check if namcallmethod ~= nil
        local Result = OldNCM(...)
        if Result == "spoof" then
            return nil
        end

        return Result
    end)

    local FENV = nil
    local OldFENV
    OldFENV = hookfunction(getfenv, newcclosure(function(...) -- prevent metamethod detections incase newcclosure is compromised
        local Args = {...}
        local Result = OldFENV(Args[1])

        if not Args[1] then
            FENV = Result
        else
            return FENV
        end

        return Result
    end))
end

local BlockedUrls = _G.Settings.BlockUrls and {"discord.com/api/webhooks/", "webhook", "websec", "000webhost", "freehosting", "repl", "ident.me",
                     "ipify.org", "dyndns.org", "checkip.amazonaws.com", "httpbin.org/ip", "ifconfig.io",
                     "ipaddress.sh", "myip.com", "ligma.wtf", "library.veryverybored"} or {} -- list of blocked urls i copied from another http spy :troll:

local BlockedInfo = _G.Settings.BlockPrivateInfo and {game:GetService("Players").LocalPlayer.Name, game.PlaceId, game.GameId} or {}

local function CheckRequest(Args)
    local Blocked = "Blocked: False. Request is safe."

    local CheckDescendants
    CheckDescendants = function(tbl)
        local Malicious = false
        for i,v in pairs(tbl) do
            if type(v) == "string" then
                if BlockedInfo[1]:lower():match(v:lower()) then
                    Malicious = "Blocked: True. Private info."
                end
                for _, str in pairs(BlockedUrls) do
                    if v:lower():match(str:lower()) then
                        Malicious = "Blocked: True. Malicious URL."
                    end
                end
            elseif type(v) == "number" then
                for _, int in pairs(BlockedInfo) do
                    if type(int) == "number" then
                        if int == v then
                            Malicious = "Blocked: True. Private info."
                        end
                    end
                end
            elseif type(v) == "table" then
                Malicious = CheckDescendants(v)
            end
        end

        return Malicious
    end

    local Result = CheckDescendants(Args[1])
    Blocked = (Result == false and Blocked or Result)

    return Blocked
end

local HookReq = newcclosure(function(OldFunction, ...)
    local Args = {...}
    local TResult = OldFunction(...)
    local DecodedSuccess, Decoded = pcall(function() return t.DecodeJSON(TResult.Body) end)

    if not DecodedSuccess then
        Decoded = TResult.Body
    end

    local Sent = "local Sent =" .. Serialize(Args[1]) .. "\n\nSent = (syn and syn.request or http and http.request or http_request or request)(Sent)\nSent = game:GetService('HttpService'):JSONDecode(Sent.Body)" -- quickly make the exact request, good for recreating backends 
    local Result = "local Received = " .. Serialize(((Decoded ~= "" and Decoded ~= nil) and Decoded or TResult))
    local Blocked = CheckRequest(Args)

    AddFrame(Args[1].Url, Sent, Result, Blocked)

    if Blocked ~= "Blocked: False. Request is safe." then
        return {}
    end

    return TResult
end)

if _G.Settings.UseHookfunction then
    for _, Function in pairs(RequestFunctions) do
        print("Attempting to hook " .. tostring(_) .. ".")

        local Success, Response = pcall(function()
            local OldFunction
            OldFunction = hookfunction(Function, newcclosure(function(...)
                return HookReq(OldFunction, ...)
            end))
        end)

        if Success then
            print("Hooked successfully")
            if ExecutorName == "Valyse" then
                break -- when tested with Valyse, each request function was called whenever you used any of the request functions, which lead to multiple frames in the GUI
            end
        else
            print("Did not hook successfully. Trying next function.")
        end
    end
end

if http and _G.Settings.UseHookMetamethod then
    print("Attempting to hook http __index metamethod")
    local Success, Response = pcall(function()
        local OldHttp = http
        getgenv().http = setmetatable({}, {
            __index = newcclosure(function(self, key)
                if key == "request" then
                    return function(...)
                        setnamecallmethod("spoof")
                        return HookReq(RequestFunctions['unc1'], ...)
                    end
                end

                return rawget(OldHttp, key)
            end)
        })
    end)

    if Success then
        print("Hooked successfully")
    end
end

if syn and _G.Settings.UseHookMetamethod then
    print("Attempting to hook syn __index metamethod")
    local Success, Response = pcall(function()
        local OldSyn = syn
        getgenv().syn = setmetatable({}, {
            __index = newcclosure(function(self, key)
                if key == "request" then
                    return function(...)
                        setnamecallmethod("spoof")
                        return HookReq(RequestFunctions['synapse'], ...)
                    end
                end

                return rawget(OldSyn, key)
            end)
        })
    end)

    if Success then
        print("Hooked successfully")
    end
end

print("luaPro HTTP Spy has loaded in.")
print([[
-- Credits --
   Product Of: luaPro
   Made by: noxu#8161

   URLs: https://luapro.xyz / https://discord.gg/9KYpKu2Nks
]])
