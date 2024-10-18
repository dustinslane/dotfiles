local cfg = {
	options = {
		offsets = {
			{
				filetype = "neo-tree",
				text = "Neo Tree",
				separator = true,
				text_align = "left",
			},
		},
		diagnostics = "nvim_lsp",
		separator_style = { "", "" },
		modified_icon = "●",
		show_close_icon = true,
		show_buffer_close_icons = true,
	},
}

require("bufferline").setup(cfg)
