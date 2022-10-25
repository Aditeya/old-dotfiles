rule = {
	matches = {
		{
			{ "node.name", "equals", "alsa_output.usb-Generic_USB_Audio-00.analog-stereo"},
		},
	},
	apply_properties = {
		["node.description"] = "USB Audio Output",
		["node.nick"] = "USB Out",
	}
}

table.insert(alsa_monitor.rules, rule)
