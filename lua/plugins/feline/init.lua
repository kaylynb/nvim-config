local M = {}

-- local filename_provider = require('plugins.feline.filename').provider

local components = {
	active = {{}, {}, {}},
	inactive = {{}, {}, {}},
}

local sep

-- active components
-- vi mode
local vi_mode = require('plugins.feline.mode')
table.insert(components.active[1], {
	provider = 'vi_mode',
	icon = '',
	hl = vi_mode.get_hl,
	left_sep = vi_mode.get_sep,
	right_sep = vi_mode.get_sep,
})

-- filename
local filename_provider = {
	name = 'file_info',
	opts = {
		file_modified_icon = '| +',
		file_readonly_icon = 'RO | ',
		type = 'unique',
		unnamed = '[No Name]',
	},
}

local filename = require('plugins.feline.filename')
table.insert(components.active[1], {
	provider = filename_provider,
	icon = '',
	hl = filename.get_hl,
})

-- git branch
sep = {
	str = ' ',
	hl = 'git_branch',
}
table.insert(components.active[1], {
	provider = 'git_branch',
	icon = '',
	-- provider = function()
	-- 	return vim.api.nvim_eval([[FugitiveHead(6)]])
	-- end,
	hl = {
		name = 'git_branch',
		fg = 'fg2',
		bg = 'bg2',
	},
	left_sep = sep,
	right_sep = sep,
})

table.insert(components.active[1], {
	provider = 'git_diff_added',
	icon = '+',
	hl = {
		name = 'git_added',
		fg = 'green',
		bg = 'bg2',
	},
	right_sep = sep,
})
table.insert(components.active[1], {
	provider = 'git_diff_removed',
	icon = '-',
	hl = {
		name = 'git_removed',
		fg = 'red',
		bg = 'bg2',
	},
	right_sep = sep,
})
table.insert(components.active[1], {
	provider = 'git_diff_changed',
	icon = '~',
	hl = {
		name = 'git_changed',
		fg = 'aqua',
		bg = 'bg2',
	},
	right_sep = sep,
})

-- bar color
-- table.insert(components.active[1], {
-- 	provider = function() return ' ' end,
-- })

table.insert(components.active[1], {
	provider = 'diagnostic_errors',
	icon = '',
	hl = {
		fg = 'red',
	},
	left_sep = {
		str = ' ',
		always_visible = true
	},
})
table.insert(components.active[1], {
	provider = 'diagnostic_warnings',
	icon = ' ',
	hl = {
		fg = 'yellow',
	},
})
table.insert(components.active[1], {
	provider = 'diagnostic_hints',
	icon = ' ',
	hl = {
		fg = 'aqua',
	},
})
table.insert(components.active[1], {
	provider = 'diagnostic_info',
	icon = ' ',
	hl = {
		fg = 'blue',
	},
})


-- file encoding
local file_meta = require('plugins.feline.filemeta')
table.insert(components.active[3], {
	provider = 'file_format',
	hl = {
		name = 'filemeta',
		fg = 'fg3',
		bg = 'bg0_s',
	},
	left_sep = {
		str = ' ',
		hl = 'filemeta',
	},
	right_sep = {
		str = ' ',
		hl = 'filemeta',
	},
})

-- file encoding
table.insert(components.active[3], {
	provider = 'file_encoding_custom',
	hl = 'filemeta',
	left_sep = {
		str = '| ',
		hl = 'filemeta',
	},
	right_sep = {
		str = ' ',
		hl = 'filemeta',
	},
})

-- file type
table.insert(components.active[3], {
	provider = 'file_type_custom',
	hl = 'filemeta',
	left_sep = {
		str = '| ',
		hl = 'filemeta',
	},
	right_sep = {
		str = ' ',
		hl = 'filemeta',
	},
})

-- line percentage
local buffer_meta = require('plugins.feline.buffermeta')
sep = {
	str = ' ',
	hl = 'line_percentage'
}
table.insert(components.active[3], {
	provider = 'line_percentage_custom',
	hl = {
		name = 'line_percentage',
		fg = 'fg2',
		bg = 'bg2',
	},
	left_sep = sep,
	right_sep = sep,
})

-- cursor position
sep = {
	str = ' ',
	hl = 'position',
}
table.insert(components.active[3], {
	provider = 'position_custom',
	hl = {
		name = 'position',
		fg = 'fg1',
		bg = 'bg3',
	},
	left_sep = sep,
	right_sep = sep,
})

-- vi_mode right indicator
table.insert(components.active[3], {
	provider = ' ',
	hl = vi_mode.get_right_hl
})

-- inactive components
-- filename
table.insert(components.inactive[1], {
	provider = filename_provider,
	icon = '',
	hl = {
		name = 'filename_inactive',
		fg = 'fg4',
		bg = 'bg0_h',
	},
})
table.insert(components.inactive[1], {
	provider = function () return ' ' end,
	hl = {
		bg = 'bg0_s',
	},
})

-- line percentage
sep = {
	str = ' ',
	hl = 'line_percentage_inactive',
}
table.insert(components.inactive[3], {
	provider = 'line_percentage_custom',
	hl = {
		name = 'line_percentage_inactive',
		fg = 'fg4',
		bg = 'bg0_h',
	},
	left_sep = sep,
	right_sep = sep,
})

-- cursor position
sep = {
	str = ' ',
	hl = 'position_inactive',
}

table.insert(components.inactive[3], {
	provider = 'position_custom',
	hl = {
		name = 'position_inactive',
		fg = 'bg0',
		bg = 'bg3',
	},
	left_sep = sep,
	right_sep = sep,
})

local ran = false

M.config = function()
	if ran then
		return
	end

	require('feline').setup({
		colors = require('plugins.feline.colors').colors,
		vi_mode_colors = vi_mode.colors,
		components = components,
		custom_providers = {
			file_encoding_custom = file_meta.file_encoding,
			file_type_custom = file_meta.file_type,
			file_format = file_meta.file_format,
			line_percentage_custom = buffer_meta.line_percentage,
			position_custom = buffer_meta.position,
		},
		force_inactive = {
			filetypes = {},
			buftypes = {},
			bufnames = {},
		},
	})

	ran = true
end

return M
