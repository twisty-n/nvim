require "packages"

--options vim.api.nvim_set_option
vim.o.number = true
vim.o.background = 'dark'
vim.o.laststatus = 2 -- always show statusbar
vim.o.backup = true
vim.go.t_Co = '256'
vim.o.hlsearch = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.cursorline = true

if (vim.api.nvim_eval('has("multi_byte")')) then
    vim.o.encoding = 'utf-8'
    vim.g.fileencoding = 'utf-8'
    vim.g.fileencodings = 'ucs-bom,utf-8,latin1'
end

vim.o.termguicolors = true

-- When launching neovim with winpty, winpty helpfully makes TERM=vtpcon. This breaks everything
-- winpty also doesn't support 256 colours. How wonderful.
local isWinPty = os.getenv("TERM") == "vtpcon"

if isWinPty then
    vim.api.nvim_exec("colorscheme default", true)
else
    vim.api.nvim_exec("colorscheme dracula", true)
end


vim.api.nvim_exec([[
" For all text files set 'textwidth' to 78 characters.
autocmd filetype text setlocal textwidth=78
set wildmode=list:longest,list:full
filetype indent on
filetype plugin on
autocmd BufRead,BufWritePre *.sh normal gg=G
setglobal autoindent smartindent
]], true)

vim.o.compatible = false

vim.o.secure = true
