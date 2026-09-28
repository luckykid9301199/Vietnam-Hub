-- [[ VIETNAM HUB BY NINH NGUYEN - KEY SYSTEM & ULTIMATE POTATO ]] --

local CorrectKey = "3011"
local DiscordLink = "https://discord.gg/your-link-here" -- Thay link Discord của bạn vào đây

-- ========================================================
--                      KEY SYSTEM UI
-- ========================================================
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Tạo ScreenGui độc lập cho Key System
local KeyScreenGui = Instance.new("ScreenGui")
KeyScreenGui.Name = "VietnamHub_KeySystem"
KeyScreenGui.Parent = (gethui and gethui()) or CoreGui or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
KeyScreenGui.ResetOnSpawn = false

-- Key Main Frame
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "MainFrame"
KeyFrame.Size = UDim2.new(0, 360, 0, 220)
KeyFrame.Position = UDim2.new(0.5, -180, 0.5, -110)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = KeyScreenGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 10)
KeyCorner.Parent = KeyFrame

-- Title Bar
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "VIETNAM HUB - KEY SYSTEM"
Title.TextColor3 = Color3.fromRGB(255, 205, 0)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.Parent = KeyFrame

-- Key TextBox (Ô nhập key)
local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.85, 0, 0, 40)
KeyInput.Position = UDim2.new(0.075, 0, 0.25, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderText = "Nhập key tại đây..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
KeyInput.Text = ""
KeyInput.TextSize = 16
KeyInput.Font = Enum.Font.SourceSans
KeyInput.Parent = KeyFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 6)
InputCorner.Parent = KeyInput

-- Status Label (Thông báo trạng thái)
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 25)
StatusLabel.Position = UDim2.new(0, 0, 0.48, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Vui lòng nhập key để tiếp tục"
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.TextSize = 14
StatusLabel.Font = Enum.Font.SourceSansItalic
StatusLabel.Parent = KeyFrame

-- Button: Submit Key (Xác nhận)
local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.4, 0, 0, 35)
SubmitBtn.Position = UDim2.new(0.075, 0, 0.7, 0)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 85)
SubmitBtn.Text = "Xác Nhận Key"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 15
SubmitBtn.Font = Enum.Font.SourceSansBold
SubmitBtn.Parent = KeyFrame

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 6)
SubmitCorner.Parent = SubmitBtn

-- Button: Get Key (Lấy key)
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.4, 0, 0, 35)
GetKeyBtn.Position = UDim2.new(0.525, 0, 0.7, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
GetKeyBtn.Text = "Get Key (Discord)"
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.TextSize = 15
GetKeyBtn.Font = Enum.Font.SourceSansBold
GetKeyBtn.Parent = KeyFrame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 6)
GetKeyCorner.Parent = GetKeyBtn

-- Xử lý sự kiện Get Key
GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(DiscordLink)
    end
    StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
    StatusLabel.Text = "Người chơi cần vào Discord để lấy key!"
end)

-- Hàm khởi chạy Main UI (Khi nhập key đúng)
local function LoadMainHub()
    KeyScreenGui:Destroy() -- Xóa UI Key
    
    -- ========================================================
    --                 MAIN SCRIPT (VIETNAM HUB)
    -- ========================================================
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
       Name = "VIETNAM HUB | By Ninh Nguyen",
       LoadingTitle = "Đang tải Vietnam Hub...",
       LoadingSubtitle = "Tối ưu hóa cực hạn CPU/GPU & Anti-AFK",
       ConfigurationSaving = { Enabled = false },
       Discord = { Enabled = false },
       KeySystem = false
    })

    local MainTab = Window:CreateTab("Siêu Tối Ưu AFK", 4483362458)

    local Lighting = game:GetService("Lighting")
    local Workspace = game:GetService("Workspace")
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local VirtualUser = game:GetService("VirtualUser")

    local UltraPotatoEnabled = false
    local Connection = nil
    local CurrentColor = Color3.fromRGB(0, 0, 0)

    -- Anti-AFK
    Players.LocalPlayer.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
    end)

    -- Hàm dọn dẹp vật thể
    local function SupremeCleanObject(obj)
        if not UltraPotatoEnabled then return end

        if obj:IsA("BasePart") then
            obj.Material = Enum.Material.SmoothPlastic
            obj.Color = CurrentColor
            obj.CastShadow = false
            
            for _, child in pairs(obj:GetChildren()) do
                if child:IsA("Decal") or child:IsA("Texture") then
                    child:Destroy()
                end
            end
        elseif obj:IsA("MeshPart") or obj:IsA("SpecialMesh") then
            obj.TextureID = ""
        elseif obj:IsA("ParticleEmitter") 
            or obj:IsA("Smoke") 
            or obj:IsA("Fire") 
            or obj:IsA("Sparkles") 
            or obj:IsA("Beam") 
            or obj:IsA("Trail") then
            
            obj.Enabled = false
            obj:Destroy()
        elseif obj:IsA("Highlight") then
            obj:Destroy()
        elseif obj:IsA("Explosion") then
            obj.Visible = false
        elseif obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("ShirtGraphic") or obj:IsA("Accessory") then
            obj:Destroy()
        end
    end

    -- Áp dụng Super Potato Mode
    local function ApplySuperPotato()
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.Brightness = 0
        Lighting.Ambient = CurrentColor
        Lighting.OutdoorAmbient = CurrentColor
        
        for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA("PostEffect") or v:IsA("Atmosphere") or v:IsA("Sky") or v:IsA("SunRaysEffect") then
                if pcall(function() v.Enabled = false end) then end
                v:Destroy()
            end
        end

        for _, obj in pairs(Workspace:GetDescendants()) do
            SupremeCleanObject(obj)
        end
    end

    -- Rayfield UI Elements
    MainTab:CreateToggle({
       Name = "Bật Siêu Cấp Potato Mode (Xóa Hiệu Ứng / Skill / Aura)",
       CurrentValue = false,
       Flag = "UltraPotatoToggle",
       Callback = function(Value)
          UltraPotatoEnabled = Value
          if UltraPotatoEnabled then
             settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
             ApplySuperPotato()
             
             Connection = Workspace.DescendantAdded:Connect(function(child)
                 if UltraPotatoEnabled then
                     task.wait()
                     SupremeCleanObject(child)
                 end
             end)
             
             Rayfield:Notify({ Title = "Vietnam Hub", Content = "Đã dọn sạch toàn bộ Model, Aura & Hiệu ứng!", Duration = 3 })
          else
             if Connection then
                 Connection:Disconnect()
                 Connection = nil
             end
             Rayfield:Notify({ Title = "Vietnam Hub", Content = "Đã tắt Potato Mode (Cần Rejoin để khôi phục đồ họa)", Duration = 3 })
          end
       end,
    })

    MainTab:CreateToggle({
       Name = "Tắt 3D Rendering (Siêu Tiết Kiệm GPU Chạy Multi-Tab)",
       CurrentValue = false,
       Flag = "Disable3DRendering",
       Callback = function(Value)
          RunService:Set3dRenderingEnabled(not Value)
          if Value then
              Rayfield:Notify({ Title = "Vietnam Hub: 3D OFF", Content = "Đã tắt dựng hình 3D! Tiết kiệm tối đa GPU.", Duration = 3 })
          else
              Rayfield:Notify({ Title = "Vietnam Hub: 3D ON", Content = "Đã bật lại hiển thị 3D.", Duration = 3 })
          end
       end,
    })

    MainTab:CreateDropdown({
       Name = "Màu Màn Hình AFK",
       Options = {"Màn Hình Đen (Black Screen)", "Màn Hình Trắng (White Screen)"},
       CurrentOption = "Màn Hình Đen (Black Screen)",
       Flag = "ColorDropdown",
       Callback = function(Option)
          if Option == "Màn Hình Đen (Black Screen)" then
              CurrentColor = Color3.fromRGB(0, 0, 0)
          else
              CurrentColor = Color3.fromRGB(255, 255, 255)
          end
          
          if UltraPotatoEnabled then
              ApplySuperPotato()
          end
       end,
    })

    MainTab:CreateSlider({
       Name = "Khóa Giới Hạn FPS AFK",
       Range = {1, 60},
       Increment = 1,
       Suffix = "FPS",
       CurrentValue = 15,
       Flag = "FPSSlider",
       Callback = function(Value)
          if setfpscap then
              setfpscap(Value)
          end
       end,
    })

    MainTab:CreateButton({
       Name = "Ép Dọn Dẹp Lại Toàn Bộ Map",
       Callback = function()
          if UltraPotatoEnabled then
              ApplySuperPotato()
              Rayfield:Notify({ Title = "Vietnam Hub", Content = "Đã quét và xóa sạch các chi tiết dư thừa!", Duration = 2 })
          else
              Rayfield:Notify({ Title = "Vietnam Hub", Content = "Hãy bật Siêu Cấp Potato Mode trước!", Duration = 2 })
          end
       end,
    })

    Rayfield:Notify({ Title = "Vietnam Hub", Content = "Kích hoạt thành công! Cảm ơn bạn đã dùng script.", Duration = 4 })
end

-- Xử lý sự kiện Submit Key
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
        StatusLabel.Text = "Key chính xác! Đang tải Vietnam Hub..."
        task.wait(1)
        LoadMainHub()
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
        StatusLabel.Text = "Key không đúng! Vui lòng kiểm tra lại."
    end
end)
