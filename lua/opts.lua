local o = vim.opt

if vim.loop.os_uname().version:match 'Windows' then
-- disable ctrl-z on windows as it locks terminal instead
	vim.api.nvim_set_keymap('n', '<C-z>', '<Nop>', {})

	-- setup pwsh for shell cmds
	o.shell = [[pwsh -NoLogo]]

	o.shellxquote=''
	o.shellcmdflag=[[-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command]]
	o.shellredir=[[| Out-File -Encoding UTF8]]

	-- use unix line endings by default
	o.fileformats = 'unix,dos'
end

--vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '

-- update title based on buffer
o.title = true

-- show line numbers
o.number = true

-- highlight line
o.cursorline = true

-- search options
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- preview substitute commands
o.inccommand = 'split'

-- disable intro
o.shortmess = vim.opt.shortmess + 'I'

-- disable showmode (lualine already shows this)
o.showmode = false

-- tabstops
local tabstop = 2
o.tabstop = tabstop
o.softtabstop = tabstop
o.shiftwidth = tabstop

-- hide buffers instead of closing
o.hidden = true

-- show whitespace chars
o.list = true
o.listchars = 'tab:→ ,eol:¬,space:·'

-- allow mouse
o.mouse = 'a'

-- Disable ~ char for buffer end
vim.opt.fillchars = { eob = ' ' }

-- rg for grep
o.grepprg=[[rg --vimgrep --smart-case]]
o.grepformat='%f:%l:%c:%m,%f:%l:%m'

local disable_bundled_plugins = {
   '2html_plugin',
   'getscript',
   'getscriptPlugin',
   'gzip',
   'logipat',
   'netrw',
   'netrwPlugin',
   'netrwSettings',
   'netrwFileHandlers',
   'matchit',
   'tar',
   'tarPlugin',
   'rrhelper',
   'spellfile_plugin',
   'vimball',
   'vimballPlugin',
   'zip',
   'zipPlugin',
}

for _, plugin in pairs(disable_bundled_plugins) do
	vim.g['loaded_' .. plugin] = 1
end

-- highlighted yank
vim.cmd [[
augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "IncSearch", timeout = 1000 })
augroup end
]]

if vim.g.vscode == 1 then
   vim.g.editorconfig = false
end
