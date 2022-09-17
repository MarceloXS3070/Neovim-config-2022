let mapleader=" " "Leader Key

set nocompatible "Not compatible with vi
syntax on "Enable syntax
set mouse=v "Use mouse with vim
set nu rnu "Number and relative number
set termguicolors "Use colors of vim
set cursorline "Show cursorline
set noswapfile "No swap file
set nobackup "No backup file
set clipboard=unnamedplus "Change clipboard
set encoding=utf-8 "Encoding method
set laststatus=2 "Show vim statusline
set noshowmode "No show mode in vim

set shiftwidth=4 "Configure tab for 4 spaces
set tabstop=4 "Configure tab for 4 spaces
set expandtab "Use spaces to press tab
set autoindent "Auto indent for vim
filetype indent on "Using indent

colorscheme tokyonight "Set colorscheme in vim

let g:prettier#config#tab_width = 4 "Config tab prettier
let g:indentLine_char = '¦' "Config caracter with indent

lua<<EOF

require'nvim-tree'.setup()

--Aplly vim colorizer
require'colorizer'.setup()

local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_state.set_offset(31)
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_state.set_offset(0)
end)

local dba = require('dashboard')

dba.custom_center = {
      {icon = '  ',
      desc = 'New File',
      shortcut = '',
      action ='DashboardNewFile'},
      {icon = 'ﮮ  ',
      desc = 'Recently opened files',
      action =  'Telescope oldfiles ',
      shortcut = ''},
      {icon = '  ',
      desc = 'Explorer in Vim',
      action = 'NvimTreeToggle',
      shortcut = ''},
      {icon = '  ',
      desc ='Open Vim Config',
      action =  'e ~/AppData/Local/nvim/ | set laststatus=2 | set showtabline=2',
      shortcut = ''},
      {icon = '  ',
      desc = 'Close Vim',
      action = 'q!',
      shortcut = ''},
}

dba.custom_header = {
    [[ _____   ______        ______           _____     ____      ____  ____      ______  _______   ]],
    [[|\    \ |\     \   ___|\     \     ____|\    \   |    |    |    ||    |    |      \/       \  ]],
    [[ \\    \| \     \ |     \     \   /     /\    \  |    |    |    ||    |   /          /\     \ ]],
    [[  \|    \  \     ||     ,_____/| /     /  \    \ |    |    |    ||    |  /     /\   / /\     |]],
    [[   |     \  |    ||     \--'\_|/|     |    |    ||    |    |    ||    | /     /\ \_/ / /    /|]],
    [[   |      \ |    ||     /___/|  |     |    |    ||    |    |    ||    ||     |  \|_|/ /    / |]],
    [[   |    |\ \|    ||     \____|\ |\     \  /    /||\    \  /    /||    ||     |       |    |  |]],
    [[   |____||\_____/||____ '     /|| \_____\/____/ || \ ___\/___ / ||____||\____\       |____|  /]],
    [[   |    |/ \|   |||    /_____/ | \ |    ||    | / \ |   ||   | / |    || |    |      |    | / ]],
    [[   |____|   |___|/|____|     | /  \|____||____|/   \|___||___|/  |____| \|____|      |____|/  ]],
    [[     \(       )/    \( |_____|/      \(    )/        \(    )/      \(      \(          )/     ]],
    [[      '       '      '    )/          '    '          '    '        '       '          '      ]],
    [[                          '                                                                   ]],
    [[]],
    [[]],
}

vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notifications = 1
vim.g.db_ui_win_position = 'right'
vim.g.db_ui_winwidth = 30

vim.g.db_ui_table_helpers = {
    mysql = {
        Count = "select count(1) from {optional_schema}{table}",
        Explain = "EXPLAIN {last_query}"
    },
    sqlite = {
        Describe = "PRAGMA table_info({table})"
    }
}

-- opening it in a new tab
vim.keymap.set('n', '<leader><leader>db', ':DBUIToggle<cr>', {})


local lualine = require('lualine')
local colors = require("tokyonight.colors").setup()

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = colors.bg_dark,
  fg       = colors.fg_dark,
  yellow   = colors.yellow,
  cyan     = colors.cyan,
  darkblue = colors.blue,
  green    = colors.green,
  orange   = colors.orange,
  violet   = colors.violet,
  magenta  = colors.magenta,
  blue     = colors.blue,
  red      = colors.red,
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue}, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.orange},
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.darkblue} }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green},
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green},
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.darkblue },
  padding = { left = 1 },
}

lualine.setup(config)

EOF

let g:dashboard_default_executive ='telescope' "Using telescope in vim dashboard
let g:lightline={ 'enable': {'statusline': 1, 'tabline': 0} }

let g:indentLine_fileTypeExclude = ['dashboard', 'NvimTree'] "Exclude files with indent
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2 "Hide tabline
autocmd FileType dashboard set laststatus=0  | autocmd WinLeave <buffer> set laststatus=2

