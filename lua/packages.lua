local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_12Gpath})
end

require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself

    -- Cosmetics
    {"dracula/vim", as="dracula"};
    {"mhinz/vim-startify", as="startify"};
    { 'hoob3rt/lualine.nvim', as="lualine"};
    { 'kyazdani42/nvim-web-devicons', as="nvim-web-devicons"};
    { 'ryanoasis/vim-devicons', as="vim-devicons"};
}

require('lualine').setup()
