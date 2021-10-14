local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself

    -- Search
    { 'nvim-lua/popup.nvim', as='popup' };
    { 'nvim-lua/plenary.nvim', as='plenary'};
    { 'nvim-telescope/telescope.nvim', as='telescope' };
    { 'easymotion/vim-easymotion' };

    -- Cosmetics
    { 'dracula/vim', as='dracula' };
    { 'dylanaraps/crayon', as='crayon-scheme' };
    { 'mhinz/vim-startify', as='startify' };
    { 'shadmansaleh/lualine.nvim', as='lualine' };
    { 'kyazdani42/nvim-web-devicons', as='nvim-web-devicons' };

    -- Language Stuff
    { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate' };

    -- Utilities
    { 'tpope/vim-surround' };
    { 'tpope/vim-fugitive' };
    { 'preservim/nerdtree' };
    { 'Raimondi/delimitMate' };
    { 'tpope/vim-eunuch' };

    -- LSP
--    { "neovim/nvim-lspconfig" }; 
--    { "kabouzeid/nvim-lspinstall" }; 
}

-- Configure Lualine
-- In order to use fonts properly in Windows Terminal, we need to install the patched font
-- By default, the Cascadia fonts don't include all the icons that we need
-- see https://stackoverflow.com/questions/66457232/windows-terminal-powershell-some-glyph-icons-are-not-rendering-when-using-cascad
require('lualine').setup { options = { theme = dracula } }

require('telescope_config')
--require('lsp')

-- Treesitter Things
local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = "all",
    ignore_install = { "haskell" },

    highlight = {
        enable = true,
        disable = {"php", "lua"}
    },

    incremental_selection = {
        enable = true,
    },

    indent = {
        enable = true,
    },
}
