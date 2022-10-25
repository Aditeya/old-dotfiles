rule = {
	matches = {
		{
			{ "node.name", "equals", "alsa_output.pci-0000_0a_00.3.iec958-stereo"},
		},
	},
	apply_properties = {
		["node.description"] = "Motherboard Audio Output",
		["node.nick"] = "Mobo Out",
	}
}

table.insert(alsa_monitor.rules, rule)
