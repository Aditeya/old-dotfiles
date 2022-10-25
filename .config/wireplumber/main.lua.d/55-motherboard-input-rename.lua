rule = {
	matches = {
		{
			{ "node.name", "equals", "alsa_input.pci-0000_0a_00.3.analog-stereo"},
		},
	},
	apply_properties = {
		["node.description"] = "Motherboard Audio Input",
		["node.nick"] = "Mobo In",
	}
}

table.insert(alsa_monitor.rules, rule)
