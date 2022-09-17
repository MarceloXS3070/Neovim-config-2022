call plug#begin('~/AppData/Local/nvim/config/plugins')
    
    "Smart autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    "Plugin for html and test text
    Plug 'mattn/emmet-vim'

    "Statusline for vim
    Plug 'nvim-lualine/lualine.nvim'

    "File explorer
    Plug 'kyazdani42/nvim-tree.lua'

    "Bufferline in top
    "Plug 'akinsho/bufferline.nvim'
    Plug 'romgrk/barbar.nvim'
    
    "Fast navigate in vim
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'easymotion/vim-easymotion'

    "Document format in vim
    Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install --frozen-lockfile --production',
      \ 'branch': 'release/0.x'
    \ }

    "Plus syntax on vim
    Plug 'sheerun/vim-polyglot'

    "Telescope a plugin with search

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

    "Dashboard in vim
    Plug 'glepnir/dashboard-nvim'

    "Icons for vim plugins
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'
    Plug 'bryanmylee/vim-colorscheme-icons'

    "Corschemes
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}
    Plug 'ayu-theme/ayu-vim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

    "Complete pairs, brackets and keys
    Plug 'jiangmiao/auto-pairs'

    "Colorize hexadecimal colors
    Plug 'norcalli/nvim-colorizer.lua'

    "Indentation
    Plug 'lukas-reineke/indent-blankline.nvim'

    "Treesitter
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-ui'

    "Databases
    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-ui'

    call plug#end()
