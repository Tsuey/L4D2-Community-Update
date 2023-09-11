"Resource/UI/KeyboardMouse.res"
{
	"KeyboardMouse"
	{
		"ControlName"		"Frame"
		"fieldName"			"KeyboardMouse"
		"xpos"				"0"
		"ypos"				"0"
		"wide"				"f0"
		"tall"				"368"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
	}
	
	"ImgBackground"	[$WIN32]
	{
		"ControlName"			"L4DMenuBackground"
		"fieldName"				"ImgBackground"
		"xpos"					"0"
		"ypos"					"109"
		"zpos"					"-1"
		"wide"					"f0"
		"tall"					"291"
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"fillColor"				"0 0 0 0"
	}
	
	"BtnEditBindings"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnEditBindings"
		"xpos"					"c-180"
		"ypos"					"85"
		"zpos"					"0"
		"wide"					"200"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"BtnCancel"
		"navDown"				"DrpMouseYInvert"
		"AllCaps"				"1"
		"labelText"				"#L4D360UI_Controller_Edit_Keys_Buttons"
		"tooltiptext"			"#L4D_edit_keys_tip"
		"style"					"DefaultButton"
		"command"				"#L4D360UI_Controller_Edit_Keys_Buttons"
		EnabledTextInsetX		"2"
		DisabledTextInsetX		"2"
		FocusTextInsetX			"2"
		OpenTextInsetX			"2"
	}
	
	"DrpMouseYInvert"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpMouseYInvert"
		"xpos"				"c-180"
		"ypos"				"105"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"BtnEditBindings"
		"navDown"			"DrpMouseFilter"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"				"L4D360HybridButton"
			"fieldName"					"BtnDropButton"
			"xpos"						"0"
			"ypos"						"0"
			"zpos"						"0"
			"wide"						"360"
			"wideatopen"				"260"	[$WIN32 && !$WIN32WIDE]
			"tall"						"15"
			"autoResize"				"1"
			"pinCorner"					"0"
			"visible"					"1"
			"enabled"					"1"
			"tabPosition"				"1"
			"AllCaps"					"1"
			"labelText"					"#GameUI_ReverseMouse"
			"tooltiptext"				"#L4D_reverse_mouse_tip"
			"style"						"DropDownButton"
			"command"					"FlmMouseYInvert"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmMouseYInvert"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmMouseYInvert"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOn"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownMouseYInvert.res"
		"OnlyActiveUser"		"1"
	}
	
	"DrpMouseFilter"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpMouseFilter"
		"xpos"				"c-180"
		"ypos"				"123"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"DrpMouseYInvert"
		"navDown"			"SldMouseSensitivity"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"				"L4D360HybridButton"
			"fieldName"					"BtnDropButton"
			"xpos"						"0"
			"ypos"						"0"
			"zpos"						"0"
			"wide"						"360"
			"wideatopen"				"260"	[$WIN32 && !$WIN32WIDE]
			"tall"						"15"
			"autoResize"				"1"
			"pinCorner"					"0"
			"visible"					"1"
			"enabled"					"1"
			"tabPosition"				"1"
			"AllCaps"					"1"
			"labelText"					"#GameUI_MouseFilter"
			"tooltiptext"				"#L4D_mouse_filter_tip"
			"style"						"DropDownButton"
			"command"					"FlmMouseFilter"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmMouseFilter"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmMouseFilter"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOn"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownMouseFilter.res"
		"OnlyActiveUser"		"1"
	}
	
	"SldMouseSensitivity"
	{
		"ControlName"			"SliderControl"
		"fieldName"				"SldMouseSensitivity"
		"xpos"					"c-180"
		"ypos"					"141"
		"zpos"					"3"
		"wide"					"360"
		"tall"					"15"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"minValue"				"1.0f"
		"maxValue"				"20.0f"
		"stepSize"				"1.0"
		"navUp"					"DrpMouseFilter"
		"navDown"				"DrpRawMouse"
		"conCommand"			"sensitivity"
		"inverseFill"			"0"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"L4D360HybridButton"
			"fieldName"				"BtnDropButton"
			"xpos"					"0"
			"ypos"					"0"
			"zpos"					"0"
			"wide"					"360"
			"wideatopen"			"260"	[$WIN32 && !$WIN32WIDE]
			"tall"					"15"
			"autoResize"			"1"
			"pinCorner"				"0"
			"visible"				"1"
			"enabled"				"1"
			"tabPosition"			"0"
			"AllCaps"				"1"
			"labelText"				"#GameUI_MouseSensitivity"
			"tooltiptext"			"#L4D_mouse_sens_tip"
			"style"					"DefaultButton"
			"command"				""
			"ActivationType"		"1"
			"OnlyActiveUser"		"1"
			"usablePlayerIndex"		"nobody"
		}
	}
	
	"DrpRawMouse"	[$WIN32]
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpRawMouse"
		"xpos"				"c-180"
		"ypos"				"159"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"				"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"SldMouseSensitivity"
		"navDown"			"DrpMouseAcceleration"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"				"L4D360HybridButton"
			"fieldName"					"BtnDropButton"
			"xpos"						"0"
			"ypos"						"0"
			"zpos"						"0"
			"wide"						"360"
			"wideatopen"				"260"	[$WIN32 && !$WIN32WIDE]
			"tall"						"15"
			"autoResize"				"1"
			"pinCorner"					"0"
			"visible"					"1"
			"enabled"					"1"
			"tabPosition"				"1"
			"AllCaps"					"1"
			"labelText"					"#GameUI_RawMouse"
			"tooltiptext"				"#GameUI_RawMouse_Hint"
			"style"						"DropDownButton"
			"command"					"FlmRawMouse"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmRawMouse"	[$WIN32]
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmRawMouse"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOn"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownRawMouse.res"
		"OnlyActiveUser"		"1"
	}
	
	"DrpMouseAcceleration"	[$WIN32]
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpMouseAcceleration"
		"xpos"				"c-180"
		"ypos"				"177"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"				"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"DrpRawMouse"
		"navDown"			"SldMouseAcceleration"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"				"L4D360HybridButton"
			"fieldName"					"BtnDropButton"
			"xpos"						"0"
			"ypos"						"0"
			"zpos"						"0"
			"wide"						"360"
			"wideatopen"				"260"	[$WIN32 && !$WIN32WIDE]
			"tall"						"15"
			"autoResize"				"1"
			"pinCorner"					"0"
			"visible"					"1"
			"enabled"					"1"
			"tabPosition"				"1"
			"AllCaps"					"1"
			"labelText"					"#GameUI_MouseAcceleration"
			"tooltiptext"				"#GameUI_MouseAcceleration_Hint"
			"style"						"DropDownButton"
			"command"					"FlmMouseAcceleration"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmMouseAcceleration"	[$WIN32]
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmMouseAcceleration"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOn"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownMouseAcceleration.res"
		"OnlyActiveUser"		"1"
	}

	"SldMouseAcceleration"	[$WIN32]
	{
		"ControlName"			"SliderControl"
		"fieldName"				"SldMouseAcceleration"
		"xpos"					"c-180"
		"ypos"					"195"
		"zpos"					"3"
		"wide"					"360"
		"tall"					"15"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"minValue"				"1.0f"
		"maxValue"				"1.4f"
		"stepSize"				"0.01"
		"navUp"					"DrpMouseAcceleration"
		"navDown"				"DrpDeveloperConsole"
		"conCommand"			"m_customaccel_exponent"
		"inverseFill"			"0"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"L4D360HybridButton"
			"fieldName"				"BtnDropButton"
			"xpos"					"0"
			"ypos"					"0"
			"zpos"					"0"
			"wide"					"360"
			"wideatopen"			"260"	[$WIN32 && !$WIN32WIDE]
			"tall"					"15"
			"autoResize"			"1"
			"pinCorner"				"0"
			"visible"				"1"
			"enabled"				"1"
			"tabPosition"			"0"
			"AllCaps"				"1"
			"labelText"				"#GameUI_MouseAccelerationAmount"
			"tooltiptext"			"#GameUI_MouseAccelerationAmount_Hint"
			"style"					"DefaultButton"
			"command"				""
			"ActivationType"		"1"
			"OnlyActiveUser"		"1"
			"usablePlayerIndex"		"nobody"
		}
	}
	
	"DrpDeveloperConsole"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpDeveloperConsole"
		"xpos"				"c-180"
		"ypos"				"213"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"SldMouseAcceleration"
		"navDown"			"DrpGamepadEnable"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"				"L4D360HybridButton"
			"fieldName"					"BtnDropButton"
			"xpos"						"0"
			"ypos"						"0"
			"zpos"						"0"
			"wide"						"360"
			"wideatopen"				"260"	[$WIN32 && !$WIN32WIDE]
			"tall"						"15"
			"autoResize"				"1"
			"pinCorner"					"0"
			"visible"					"1"
			"enabled"					"1"
			"tabPosition"				"1"
			"AllCaps"					"1"
			"labelText"					"#L4D360UI_KeyboardOptions_Developer"
			"tooltiptext"				"#L4D_dvlpr_cnsl_tip"
			"style"						"DropDownButton"
			"command"					"FlmDeveloperConsole"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmDeveloperConsole"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmDeveloperConsole"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOn"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownDeveloperConsole.res"
		"OnlyActiveUser"		"1"
	}
	
	"DrpGamepadEnable"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpGamepadEnable"
		"xpos"				"c-180"
		"ypos"				"233"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"DrpDeveloperConsole"
		"navDown"			"SldGamepadHSensitivity"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"				"L4D360HybridButton"
			"fieldName"					"BtnDropButton"
			"xpos"						"0"
			"ypos"						"0"
			"zpos"						"0"
			"wide"						"360"
			"wideatopen"				"260"	[$WIN32 && !$WIN32WIDE]
			"tall"						"15"
			"autoResize"				"1"
			"pinCorner"					"0"
			"visible"					"1"
			"enabled"					"1"
			"tabPosition"				"1"
			"AllCaps"					"1"
			"labelText"					"#GameUI_Joystick"
			"tooltiptext"				"#L4D_gamepad_tip"
			"style"						"DropDownButton"
			"command"					"FlmGamepadEnable"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmGamepadEnable"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGamepadEnable"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOff"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownGamepadEnable.res"
		"OnlyActiveUser"		"1"
	}
	
	"SldGamepadHSensitivity"
	{
		"ControlName"			"SliderControl"
		"fieldName"				"SldGamepadHSensitivity"
		"xpos"					"c-180"
		"ypos"					"251"
		"zpos"					"3"
		"wide"					"360"
		"tall"					"15"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"minValue"				"-7.0f"
		"maxValue"				"-0.5f"
		"stepSize"				"0.5"
		"navUp"					"DrpGamepadEnable"
		"navDown"				"SldGamepadVSensitivity"
		"conCommand"			"joy_yawsensitivity"
		"inverseFill"			"1"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"L4D360HybridButton"
			"fieldName"				"BtnDropButton"
			"xpos"					"0"
			"ypos"					"0"
			"zpos"					"0"
			"wide"					"360"
			"wideatopen"			"260"	[$WIN32 && !$WIN32WIDE]
			"tall"					"15"
			"autoResize"			"1"
			"pinCorner"				"0"
			"visible"				"1"
			"enabled"				"1"
			"tabPosition"			"0"
			"AllCaps"				"1"
			"labelText"				"#GameUI_JoystickLookSpeedYaw"
			"tooltiptext"			"#L4D_hor_sense_tip"
			"disabled_tooltiptext"	"#L4D360UI_KeyboardOptions_GamepadDesc"
			"style"					"DefaultButton"
			"command"				""
			"ActivationType"		"1"
			"OnlyActiveUser"		"1"
			"usablePlayerIndex"		"nobody"
		}
	}
	
	"SldGamepadVSensitivity"
	{
		"ControlName"			"SliderControl"
		"fieldName"				"SldGamepadVSensitivity"
		"xpos"					"c-180"
		"ypos"					"269"
		"zpos"					"3"
		"wide"					"360"
		"tall"					"15"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"minValue"				"0.5"
		"maxValue"				"7.0"
		"stepSize"				"0.5"
		"navUp"					"SldGamepadHSensitivity"
		"navDown"				"DrpGamepadYInvert"
		"conCommand"			"joy_pitchsensitivity"
		"inverseFill"			"0"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"			"L4D360HybridButton"
			"fieldName"				"BtnDropButton"
			"xpos"					"0"
			"ypos"					"0"
			"zpos"					"0"
			"wide"					"360"
			"wideatopen"			"260"	[$WIN32 && !$WIN32WIDE]
			"tall"					"15"
			"autoResize"			"1"
			"pinCorner"				"0"
			"visible"				"1"
			"enabled"				"1"
			"tabPosition"			"0"
			"AllCaps"				"1"
			"labelText"				"#GameUI_JoystickLookSpeedPitch"
			"tooltiptext"			"#L4D_vert_sens_tip"
			"disabled_tooltiptext"	"#L4D360UI_KeyboardOptions_GamepadDesc"
			"style"					"DefaultButton"
			"command"				""
			"ActivationType"		"1"
			"OnlyActiveUser"		"1"
			"usablePlayerIndex"		"nobody"
		}
	}
	
	"DrpGamepadYInvert"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpGamepadYInvert"
		"xpos"				"c-180"
		"ypos"				"287"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"SldGamepadVSensitivity"
		"navDown"			"DrpGamepadSwapSticks"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"				"L4D360HybridButton"
			"fieldName"					"BtnDropButton"
			"xpos"						"0"
			"ypos"						"0"
			"zpos"						"0"
			"wide"						"360"
			"wideatopen"				"260"	[$WIN32 && !$WIN32WIDE]
			"tall"						"15"
			"autoResize"				"1"
			"pinCorner"					"0"
			"visible"					"1"
			"enabled"					"1"
			"tabPosition"				"1"
			"AllCaps"					"1"
			"labelText"					"#GameUI_ReverseJoystick"
			"tooltiptext"				"#L4D_gamepad_reverse_tip"
			"disabled_tooltiptext"		"#L4D360UI_KeyboardOptions_GamepadDesc"
			"style"						"DropDownButton"
			"command"					"FlmGamepadYInvert"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmGamepadYInvert"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGamepadYInvert"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOn"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownGamepadYInvert.res"
		"OnlyActiveUser"		"1"
	}
	
	"DrpGamepadSwapSticks"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpGamepadSwapSticks"
		"xpos"				"c-180"
		"ypos"				"305"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"DrpGamepadYInvert"
		"navDown"			"DrpGamepadAutoAim"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"				"L4D360HybridButton"
			"fieldName"					"BtnDropButton"
			"xpos"						"0"
			"ypos"						"0"
			"zpos"						"0"
			"wide"						"360"
			"wideatopen"				"260"	[$WIN32 && !$WIN32WIDE]
			"tall"						"15"
			"autoResize"				"1"
			"pinCorner"					"0"
			"visible"					"1"
			"enabled"					"1"
			"tabPosition"				"1"
			"AllCaps"					"1"
			"labelText"					"#GameUI_JoystickSouthpaw"
			"tooltiptext"				"#L4D_gamepad_sticks_tip"
			"disabled_tooltiptext"		"#L4D360UI_KeyboardOptions_GamepadDesc"
			"style"						"DropDownButton"
			"command"					"FlmGamepadSwapSticks"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmGamepadSwapSticks"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGamepadSwapSticks"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOn"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownGamepadSwapSticks.res"
		"OnlyActiveUser"		"1"
	}

	"DrpGamepadAutoAim"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpGamepadAutoAim"
		"xpos"				"c-180"
		"ypos"				"323"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"DrpGamepadSwapSticks"
		"navDown"			"DrpGamepadVibration"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"				"L4D360HybridButton"
			"fieldName"					"BtnDropButton"
			"xpos"						"0"
			"ypos"						"0"
			"zpos"						"0"
			"wide"						"360"
			"wideatopen"				"260"	[$WIN32 && !$WIN32WIDE]
			"tall"						"15"
			"autoResize"				"1"
			"pinCorner"					"0"
			"visible"					"1"
			"enabled"					"1"
			"tabPosition"				"1"
			"AllCaps"					"1"
			"labelText"					"#GameUI_AutoAim"
			"tooltiptext"				"#L4D_autoaim_tip"
			"disabled_tooltiptext"		"#L4D360UI_KeyboardOptions_GamepadDesc"
			"style"						"DropDownButton"
			"command"					"FlmGamepadAutoAim"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmGamepadAutoAim"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGamepadAutoAim"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOn"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownGamepadAutoAimEnable.res"
		"OnlyActiveUser"		"1"
	}

	"DrpGamepadVibration"
	{
		"ControlName"		"DropDownMenu"
		"fieldName"			"DrpGamepadVibration"
		"xpos"				"c-180"
		"ypos"				"341"
		"zpos"				"3"
		"wide"				"360"
		"tall"				"15"
		"visible"			"1"
		"enabled"			"1"
		"usetitlesafe"		"0"
		"tabPosition"		"0"
		"navUp"				"DrpGamepadAutoAim"
		"navDown"			"BtnCancel"
				
		//button and label
		"BtnDropButton"
		{
			"ControlName"				"L4D360HybridButton"
			"fieldName"					"BtnDropButton"
			"xpos"						"0"
			"ypos"						"0"
			"zpos"						"0"
			"wide"						"360"
			"wideatopen"				"260"	[$WIN32 && !$WIN32WIDE]
			"tall"						"15"
			"autoResize"				"1"
			"pinCorner"					"0"
			"visible"					"1"
			"enabled"					"1"
			"tabPosition"				"1"
			"AllCaps"					"1"
			"labelText"					"#L4D360UI_Vibration"
			"tooltiptext"				"#L4D_vibration_tip"
			"disabled_tooltiptext"		"#L4D360UI_KeyboardOptions_GamepadDesc"
			"style"						"DropDownButton"
			"command"					"FlmGamepadVibration"
			"ActivationType"			"1"
			"OnlyActiveUser"			"1"
		}
	}
	
	//flyouts		
	"FlmGamepadVibration"
	{
		"ControlName"			"FlyoutMenu"
		"fieldName"				"FlmGamepadVibration"
		"visible"				"0"
		"wide"					"0"
		"tall"					"0"
		"zpos"					"4"
		"InitialFocus"			"BtnOn"
		"ResourceFile"			"resource/UI/L4D360UI/DropDownGamepadVibrationEnable.res"
		"OnlyActiveUser"		"1"
	}

	"BtnCancel"
	{
		"ControlName"			"L4D360HybridButton"
		"fieldName"				"BtnCancel"
		"xpos"					"c-180"
		"ypos"					"361"
		"zpos"					"0"
		"wide"					"200"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"0"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"wrap"					"1"
		"navUp"					"DrpGamepadVibration"
		"navDown"				"BtnEditBindings"
		"AllCaps"				"1"
		"labelText"				"#L4D360UI_Done"
		"tooltiptext"			"#L4D360UI_Tooltip_Back"
		"style"					"RedButton"
		"command"				"Back"
		EnabledTextInsetX		"2"
		DisabledTextInsetX		"2"
		FocusTextInsetX			"2"
		OpenTextInsetX			"2"
	}
}
