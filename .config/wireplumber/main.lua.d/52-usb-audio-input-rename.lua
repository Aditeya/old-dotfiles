rule = {
	matches = {
		{
			{ "node.name", "equals", "alsa_input.usb-Generic_USB_Audio-00.analog-stereo"},
		},
	},
	apply_properties = {
		["node.description"] = "USB Audio Input",
		["node.nick"] = "USB In",
	}
}

table.insert(alsa_monitor.rules, rule)
