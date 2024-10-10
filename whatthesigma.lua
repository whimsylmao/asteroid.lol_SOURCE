local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window =
    Rayfield:CreateWindow(
    {
        Name = "asteroid.lol script hub !",
        LoadingTitle = "originally asteroid services | asteroid.lol",
        LoadingSubtitle = "by asteroidlord | asteroidlordfr on discord",
        ConfigurationSaving = {
            Enabled = false,
            FolderName = nil,
            FileName = "asteroid_lol_data"
        },
        Discord = {
            Enabled = false,
            Invite = "94rAQrWADg",
            RememberJoins = true
        },
        KeySystem = false,
        KeySettings = {
            Title = "asteroid.lol | Key",
            Subtitle = "Key System",
            Note = "Use key asteroid | Open Beta",
            FileName = "AsteroidLolKey1",
            SaveKey = false,
            GrabKeyFromSite = true,
            Key = {"https://pastebin.com/raw/2R5C6ZHm"}
        }
    }
)

local MainTab = Window:CreateTab("Home", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify(
    {
        Title = "Loading...",
        Content = "asteroidlordfr on Discord",
        Duration = 5,
        Image = 13047715178,
        Actions = {
            Ignore = {
                Name = "Wow that's awesome",
                Callback = function()
                    print("okay now that was epic")
                end
            }
        }
    }
)

local Button =
    MainTab:CreateButton(
    {
        Name = "Infinite Jump Toggle",
        Callback = function()
            _G.infinjump = not _G.infinjump

            if _G.infinJumpStarted == nil then
                _G.infinJumpStarted = true
                game.StarterGui:SetCore(
                    "SendNotification",
                    {
                        Title = "Youtube Hub",
                        Text = "Infinite Jump Activated!",
                        Duration = 5
                    }
                )

                local plr = game:GetService("Players").LocalPlayer
                local m = plr:GetMouse()
                m.KeyDown:connect(
                    function(k)
                        if _G.infinjump and k:byte() == 32 then
                            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                            if humanoid then
                                humanoid:ChangeState("Jumping")
                                wait()
                                humanoid:ChangeState("Seated")
                            end
                        end
                    end
                )
            end
        end
    }
)

local Slider =
    MainTab:CreateSlider(
    {
        Name = "Player Speed",
        Range = {1, 350},
        Increment = 1,
        Suffix = "Speed",
        CurrentValue = 16,
        Flag = "sliderws",
        Callback = function(Value)
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = Value
            end
        end
    }
)

local Slider =
    MainTab:CreateSlider(
    {
        Name = "Jump Power",
        Range = {1, 350},
        Increment = 1,
        Suffix = "Power",
        CurrentValue = 50,
        Flag = "sliderjp",
        Callback = function(Value)
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = Value
            end
        end
    }
)

local Input =
    MainTab:CreateInput(
    {
        Name = "Walkspeed",
        PlaceholderText = "1-500",
        RemoveTextAfterFocusLost = true,
        Callback = function(Text)
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = tonumber(Text) or 16
            end
        end
    }
)

local OtherSection = MainTab:CreateSection("Other")

local Toggle =
    MainTab:CreateToggle(
    {
        Name = "All Advertisement (CS)",
        CurrentValue = false,
        Flag = "Toggle1",
        Callback = function(Value)
        end
    }
)

local Visuals = Window:CreateTab("Visual", nil)

local Button1 =
    Visuals:CreateButton(
    {
        Name = "F3X / BTools (CS)",
        Callback = function()
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")

            local function createTool(name)
                local tool = Instance.new("Tool")
                tool.Name = name
                tool.RequiresHandle = true

                local handle = Instance.new("Part")
                handle.Name = "Handle"
                handle.Size = Vector3.new(1, 1, 1)
                handle.BrickColor = BrickColor.new("Bright yellow")
                handle.Material = Enum.Material.SmoothPlastic
                handle.CanCollide = false
                handle.Parent = tool

                local label = Instance.new("BillboardGui")
                label.Size = UDim2.new(1, 0, 1, 0)
                label.Adornee = handle
                label.AlwaysOnTop = true
                label.Parent = handle

                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Text = "F3X"
                textLabel.TextColor3 = Color3.new(1, 1, 1)
                textLabel.BackgroundTransparency = 1
                textLabel.Parent = label

                return tool
            end

            local bTools = {"Hammer", "Wrench", "Spanner"}

            for _, toolName in ipairs(bTools) do
                local tool = createTool(toolName)
                tool.Parent = backpack
            end
        end
    }
)

local Button2 =
    Visuals:CreateButton(
    {
        Name = "Sword (CS)",
        Callback = function()
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")

            local sword = Instance.new("Tool")
            sword.Name = "Sword"
            sword.RequiresHandle = true

            local handle = Instance.new("Part")
            handle.Name = "Handle"
            handle.Size = Vector3.new(1, 5, 1)
            handle.BrickColor = BrickColor.new("Bright blue")
            handle.Material = Enum.Material.SmoothPlastic
            handle.CanCollide = false
            handle.Parent = sword

            local damage = 10

            sword.Activated:Connect(
                function()
                    local character = player.Character or player.CharacterAdded:Wait()
                    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

                    local ray = Ray.new(humanoidRootPart.Position, humanoidRootPart.CFrame.LookVector * 5)
                    local hit, position = game.Workspace:FindPartOnRay(ray, character)

                    if hit and hit.Parent:FindFirstChild("Humanoid") then
                        hit.Parent.Humanoid:TakeDamage(damage)
                    end
                end
            )

            sword.Parent = backpack
        end
    }
)

local Button3 =
    Visuals:CreateButton(
    {
        Name = "Spike Cube (CS)",
        Callback = function()
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")

            local rpg = Instance.new("Tool")
            rpg.Name = "Spike Cube of Death!"
            rpg.RequiresHandle = true

            local handle = Instance.new("Part")
            handle.Name = "Handle"
            handle.Size = Vector3.new(1, 1, 1)
            handle.BrickColor = BrickColor.new("Bright red")
            handle.Material = Enum.Material.Metal
            handle.CanCollide = false
            handle.Parent = rpg

            local fire = Instance.new("ParticleEmitter")
            fire.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
            fire.Size = NumberSequence.new(1)
            fire.Lifetime = NumberRange.new(0.5)
            fire.Rate = 100
            fire.Parent = handle

            rpg.Parent = backpack
        end
    }
)

local Button4 =
    Visuals:CreateButton(
    {
        Name = "Custom RPG (CS)",
        Callback = function()
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")

            local rpg = Instance.new("Tool")
            rpg.Name = "RPG"
            rpg.RequiresHandle = true

            local handle = Instance.new("Part")
            handle.Name = "Handle"
            handle.Size = Vector3.new(1, 1, 1)
            handle.BrickColor = BrickColor.new("Bright red")
            handle.Material = Enum.Material.Metal
            handle.CanCollide = false
            handle.Parent = rpg

            local function onActivated()
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

                local rocket = Instance.new("Part")
                rocket.Size = Vector3.new(1, 1, 3)
                rocket.BrickColor = BrickColor.new("Bright yellow")
                rocket.Material = Enum.Material.Neon
                rocket.Position = humanoidRootPart.Position + humanoidRootPart.CFrame.LookVector * 5
                rocket.Anchored = false
                rocket.Parent = game.Workspace

                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Velocity = humanoidRootPart.CFrame.LookVector * 100
                bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
                bodyVelocity.Parent = rocket

                rocket.Touched:Connect(
                    function(hit)
                        if hit and hit.Parent then
                            local explosion = Instance.new("Explosion")
                            explosion.Position = rocket.Position
                            explosion.BlastRadius = 10
                            explosion.BlastPressure = 0
                            explosion.Parent = game.Workspace
                            rocket:Destroy()
                        end
                    end
                )

                wait(5)
                rocket:Destroy()
            end

            rpg.Activated:Connect(onActivated)
            rpg.Parent = backpack
        end
    }
)

local Movingtab = Window:CreateTab("Movement", nil)

local Button1 =
    Movingtab:CreateButton(
    {
        Name = "Fly",
        Callback = function()
            local player = game.Players.LocalPlayer
            local mouse = player:GetMouse()
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local flying = false
            local speed = 50
            local bodyVelocity

            local function fly()
                flying = true
                bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
                bodyVelocity.Parent = humanoidRootPart

                while flying do
                    local direction = Vector3.new(0, 0, 0)
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                        direction = direction + humanoidRootPart.CFrame.LookVector
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                        direction = direction - humanoidRootPart.CFrame.LookVector
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                        direction = direction - humanoidRootPart.CFrame.RightVector
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                        direction = direction + humanoidRootPart.CFrame.RightVector
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                        direction = direction + Vector3.new(0, 1, 0)
                    end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
                        direction = direction - Vector3.new(0, 1, 0)
                    end
                    bodyVelocity.Velocity = direction.Unit * speed
                    wait()
                end
                bodyVelocity:Destroy()
            end

            local function onInputBegan(input)
                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.E then
                    fly()
                end
            end

            local function onInputEnded(input)
                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.E then
                    flying = false
                end
            end

            game:GetService("UserInputService").InputBegan:Connect(onInputBegan)
            game:GetService("UserInputService").InputEnded:Connect(onInputEnded)

            player.CharacterAdded:Connect(
                function(newCharacter)
                    character = newCharacter
                    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                end
            )
        end
    }
)

local Button2 =
    Movingtab:CreateButton(
    {
        Name = "Disable Fly",
        Callback = function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local flying = false

            local function disableFly()
                flying = false
                if humanoidRootPart:FindFirstChild("BodyVelocity") then
                    humanoidRootPart.BodyVelocity:Destroy()
                end
            end

            local function onInputBegan(input)
                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.E then
                    disableFly()
                end
            end

            game:GetService("UserInputService").InputBegan:Connect(onInputBegan)

            player.CharacterAdded:Connect(
                function(newCharacter)
                    character = newCharacter
                    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                end
            )
        end
    }
)

local Button2 =
    Movingtab:CreateButton(
    {
        Name = "Placeholder",
        Callback = function()
            -- e
        end
    }
)

local FartTab = Window:CreateTab("Scripts", nil)

local Button1 =
    FartTab:CreateButton(
    {
        Name = "Infinite Yield",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/refs/heads/master/source"))(

            )
        end
    }
)

local Button2 =
    FartTab:CreateButton(
    {
        Name = "Catbypasser",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/shadow62x/catbypass/main/upfix"))()
            Rayfield:Notify(
                {
                    Title = "Credits",
                    Content = "discord.gg/catbypasser | Their Discord server!",
                    Duration = 5,
                    Image = 13047715178,
                    Actions = {
                        Ignore = {
                            Name = "Cool!",
                            Callback = function()
                                print("okay now that was epic (catbypasser)")
                            end
                        }
                    }
                }
            )
        end
    }
)

local Button3 =
    FartTab:CreateButton(
    {
        Name = "Dex Explorer",
        Callback = function()
            loadstring(
                game:HttpGet("https://raw.githubusercontent.com/LorekeeperZinnia/Dex/refs/heads/master/main.lua")
            )()
        end
    }
)

local Button4 =
    FartTab:CreateButton(
    {
        Name = "Placeholder",
        Callback = function()
        end
    }
)

local Misc = Window:CreateTab("Misc", nil)

local Button1 =
    Misc:CreateButton(
    {
        Name = "Placeholder",
        Callback = function()
            -- e
        end
    }
)
