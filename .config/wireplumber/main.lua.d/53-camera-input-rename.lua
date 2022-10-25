rule = {
	matches = {
		{
			{ "device.name", "equals", "alsa_card.usb-Sonix_Technology_Co.__Ltd._ZZ3_ZZ3-02"},
		},
	},
	apply_properties = {
		["device.description"] = "Camera Audio Input",
		["device.nick"] = "Cam Input",
		["device.disabled"] = true,
	}
}

table.insert(alsa_monitor.rules, rule)
