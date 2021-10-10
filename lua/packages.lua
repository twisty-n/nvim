local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_12Gpath})
end

require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself

    -- Search
    { 'nvim-lua/popup.nvim', as='popup' };
    { 'nvim-lua/plenary.nvim', as='plenary'};
    { 'nvim-telescope/telescope.nvim', as='telescope' };

    -- Cosmetics
    { "dracula/vim", as="dracula" };
    { "dylanaraps/crayon", as="crayon-scheme" };
    { "mhinz/vim-startify", as="startify" };
    { 'hoob3rt/lualine', as="lualine" };
    { 'kyazdani42/nvim-web-devicons', as="nvim-web-devicons" };
    { 'ryanoasis/vim-devicons', as="vim-devicons" };

    -- Language Stuff
    { 'nvim-treesitter/nvim-treesitter', run=':TSUpdate' };
}

require('lualine').setup()

-- Treesitter Things
local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = "all",

    highlight = {
        enable = true,
        disable = {"php"}
    },

    incremental_selection = {
        enable = true,
    },

    indent = {
        enable = true,
    },
}
