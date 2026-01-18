--This file is a Localscript in Roblox Studio
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local RemoveEvent = ReplicatedStorage.NoticeSystem.Creattip
RemoveEvent.OnClientEvent:Connect(function(Text,Title,sec: number)
	local s = false
	local Frame = script.tip:Clone()
	Frame.Parent = script.Parent.Parent.Main
	Frame:TweenSize(UDim2.new(1, 0,0.186, 0),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Sine,
		0.5,
		false
	)
	Frame.Title.Text = Title
	Frame.Maintext.Text = Text
	local Frame2 = script.tip2:Clone()
	Frame2.Parent = game.Workspace.notiepad.SurfaceGui.Main.ScrollingFrame
	Frame2.Title.Text = Title
	Frame2.Maintext.Text = Text
	local Button = Frame.TextButton
	Button.Interactable = true
	Button.MouseEnter:Connect(function()
		Button.BackgroundTransparency = 0.45
		Button.TextTransparency = 0
		Button.MouseLeave:Connect(function()
			Button.BackgroundTransparency = 1
			Button.TextTransparency = 1
		end)
		Button.MouseButton1Click:Connect(function()
			Frame:TweenSize(UDim2.new(0, 0,0.186, 0),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Sine,
				0.5,
				false
			)
			wait(0.5)
			Frame:Destroy()
			s = true
		end)
	end)
	local a = 0
	while wait(1) do
		if a == sec then
			Frame:TweenSize(UDim2.new(0, 0,0.186, 0),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Sine,
				0.5,
				false
			)
			wait(0.5)
			Frame:Destroy()
			s = false
			break
		elseif a ~= sec and s ~= true then
			a = a + 1
			print(a,sec)
		end
	end
end)
