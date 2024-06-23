--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- appending
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.clipboard = 'unnamedplus'

-- shiftwidth
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.ignorecase = false
vim.opt.smartcase = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- vim.api.nvim_create_autocmd { 'BufNewFile', 'BufferRead' {}}

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  --   { 'numToStr/Comment.nvim', opts = {} },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]plit', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
      }
      -- visual mode
      require('which-key').register({
        ['<leader>h'] = { 'Git [H]unk' },
      }, { mode = 'v' })
    end,
  },
  { -- Useful plugin to show you pending keybinds.
    'vimwiki/vimwiki',
    lazy = false, -- Sets the loading event to 'VimEnter'
    init = function() -- This is the function that runs, AFTER loading
      vim.g.vimwiki_list = {
        {
          path = '~/docs/vimwiki',
          path_html = '~/docs/vimwiki_html',
          syntax = 'default',
          ext = 'wiki',
        },
        {
          path = '~/docs/wiki',
          path_html = '~/docs/wiki_html',
          syntax = 'markdown',
          ext = 'md',
        },
      }
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
  },
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      -- Set header
      dashboard.section.header.val = {
        '                                                     ',
        '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
        '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
        '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
        '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
        '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
        '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
        '                                                     ',
      }

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button('e', '  > New File', '<cmd>ene<CR>'),
        dashboard.button('SPC ee', '  > Toggle file explorer', '<cmd>NvimTreeToggle<CR>'),
        dashboard.button('SPC ff', '󰱼 > Find File', '<cmd>Telescope find_files<CR>'),
        dashboard.button('SPC fs', '  > Find Word', '<cmd>Telescope live_grep<CR>'),
        dashboard.button('SPC wr', '󰁯  > Restore Session For Current Directory', '<cmd>SessionRestore<CR>'),
        dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'),
      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
    end,
  },
  {
    'rmagatti/auto-session',
    config = function()
      local auto_session = require 'auto-session'

      auto_session.setup {
        auto_restore_enabled = false,
        auto_session_suppress_dirs = { '~/', '~/Dev/', '~/Downloads', '~/Documents', '~/Desktop/' },
      }

      local keymap = vim.keymap

      keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' }) -- restore last workspace session for current directory
      keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' }) -- save workspace session for current working directory
    end,
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    version = '*',
    opts = {
      options = {
        mode = 'tabs',
        separator_style = 'slant',
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local lualine = require 'lualine'
      local lazy_status = require 'lazy.status' -- to configure lazy pending updates count

      local colors = {
        blue = '#65D1FF',
        green = '#3EFFDC',
        violet = '#FF61EF',
        yellow = '#FFDA7B',
        red = '#FF4A4A',
        fg = '#c3ccdc',
        bg = '#112638',
        inactive_bg = '#2c3043',
      }

      local my_lualine_theme = {
        normal = {
          a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        insert = {
          a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.violet, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
          b = { bg = colors.bg, fg = colors.fg },
          c = { bg = colors.bg, fg = colors.fg },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
          b = { bg = colors.inactive_bg, fg = colors.semilightgray },
          c = { bg = colors.inactive_bg, fg = colors.semilightgray },
        },
      }

      -- configure lualine with modified theme
      lualine.setup {
        options = {
          theme = my_lualine_theme,
        },
        sections = {
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = '#ff9e64' },
            },
            { 'encoding' },
            { 'fileformat' },
            { 'filetype' },
          },
        },
      }
    end,
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  },
  {
    'szw/vim-maximizer',
    keys = {
      { '<leader>sm', '<cmd>MaximizerToggle<CR>', desc = 'Maximize/minimize a split' },
    },
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
  {
    'tpope/vim-dadbod',
    opt = true,
    requires = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
    },
    config = function()
      require('config.dadbod').setup()
    end,
  },
  {
    'kristijanhusak/vim-dadbod-completion',
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open lazy git' },
    },
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  {
    'windwp/nvim-autopairs',
    event = { 'InsertEnter' },
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    config = function()
      -- import nvim-autopairs
      local autopairs = require 'nvim-autopairs'

      -- configure autopairs
      autopairs.setup {
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = { 'string' }, -- don't add pairs in lua string treesitter nodes
          javascript = { 'template_string' }, -- don't add pairs in javscript template_string treesitter nodes
          java = false, -- don't check treesitter on java
        },
      }

      -- import nvim-autopairs completion functionality
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

      -- import nvim-cmp plugin (completions plugin)
      local cmp = require 'cmp'

      -- make autopairs and completion work together
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      -- import comment plugin safely
      local comment = require 'Comment'

      local ts_context_commentstring = require 'ts_context_commentstring.integrations.comment_nvim'

      -- enable comment
      comment.setup {
        -- for commenting tsx, jsx, svelte, html files
        pre_hook = ts_context_commentstring.create_pre_hook(),
      }
    end,
  },
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup { comment_empty = false }
    end,
  },
  {
    'kylechui/nvim-surround',
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  {
    'hkupty/iron.nvim',
    config = function(plugins, opts)
      local iron = require 'iron.core'

      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              command = { 'ipython' },
            },
          },
          repl_open_cmd = require('iron.view').right(60),
        },
        keymaps = {
          send_motion = '<leader>rc',
          visual_send = '<leader>rc',
          send_file = '<leader>rf',
          send_line = '<leader>rl',
          send_mark = '<leader>rm',
          mark_motion = '<leader>rmc',
          mark_visual = '<leader>rmc',
          remove_mark = '<leader>rmd',
          cr = '<lcader>r<cr>',
          interrupt = '<leader>c<leader>',
          exit = '<leader>rq',
          clear = '<laeder>rx',
        },
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true,
      }
      -- iron also has a list of commands
      vim.keymap.set('n', '<leader>rs', '<cmd>IronRepl<CR>')
      vim.keymap.set('n', '<leader>rr', '<cmd>IronRestart<CR>')
      vim.keymap.set('n', '<leader>rF', '<cmd>IronFocus<CR>')
      vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<CR>')
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'vim',
        'vimdoc',
        'python',
        'sql',
        'javascript',
        'typescript',
        'regex',
        'css',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  {
    'vhyrro/luarocks.nvim',
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
    -- opts = {
    --   rocks = { 'fzy', 'pathlib.nvim ~> 1.0' },
    -- },
  },
  {
    'quarto-dev/quarto-nvim',
    ft = { 'quarto' },
    dev = false,
    opts = {
      lspFeatures = {
        languages = { 'r', 'python', 'julia', 'bash', 'lua', 'html', 'dot', 'javascript', 'typescript', 'ojs' },
      },
      codeRunner = {
        enabled = true,
        default_method = 'slime',
      },
    },
    dependencies = {
      -- for language features in code cells
      -- configured in lua/plugins/lsp.lua and
      -- added as a nvim-cmp source in lua/plugins/completion.lua
      'jmbuhr/otter.nvim',
    },
  },
  { -- directly open ipynb files as quarto docuements
    -- and convert back behind the scenes
    'GCBallesteros/jupytext.nvim',
    opts = {
      custom_language_formatting = {
        python = {
          extension = 'qmd',
          style = 'quarto',
          force_ft = 'quarto',
        },
        r = {
          extension = 'qmd',
          style = 'quarto',
          force_ft = 'quarto',
        },
      },
    },
  },
  { -- send code from python/r/qmd documets to a terminal or REPL
    -- like ipython, R, bash
    'jpalardy/vim-slime',
    dev = false,
    init = function()
      vim.b['quarto_is_python_chunk'] = false
      Quarto_is_in_python_chunk = function()
        require('otter.tools.functions').is_otter_language_context 'python'
      end

      vim.cmd [[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
      return [a:text, "\n"]
      else
      return [a:text]
      end
      end
      endfunction
      ]]

      vim.g.slime_target = 'neovim'
      vim.g.slime_no_mappings = true
      vim.g.slime_python_ipython = 1
    end,
    config = function()
      vim.g.slime_input_pid = false
      vim.g.slime_suggest_default = true
      vim.g.slime_menu_config = false
      vim.g.slime_neovim_ignore_unlisted = true

      local function mark_terminal()
        local job_id = vim.b.terminal_job_id
        vim.print('job_id: ' .. job_id)
      end

      local function set_terminal()
        vim.fn.call('slime#config', {})
      end
      vim.keymap.set('n', '<leader>cm', mark_terminal, { desc = '[m]ark terminal' })
      vim.keymap.set('n', '<leader>cs', set_terminal, { desc = '[s]et terminal' })
    end,
  },
  { -- paste an image from the clipboard or drag-and-drop
    'HakonHarnes/img-clip.nvim',
    event = 'BufEnter',
    ft = { 'markdown', 'quarto', 'latex' },
    opts = {
      default = {
        dir_path = 'img',
      },
      filetypes = {
        markdown = {
          url_encode_path = true,
          template = '![$CURSOR]($FILE_PATH)',
          drag_and_drop = {
            download_images = false,
          },
        },
        quarto = {
          url_encode_path = true,
          template = '![$CURSOR]($FILE_PATH)',
          drag_and_drop = {
            download_images = false,
          },
        },
      },
    },
    config = function(_, opts)
      require('img-clip').setup(opts)
      vim.keymap.set('n', '<leader>ii', ':PasteImage<cr>', { desc = 'insert [i]mage from clipboard' })
    end,
  },
  { -- preview equations
    'jbyuki/nabla.nvim',
    keys = {
      { '<leader>qm', ':lua require"nabla".toggle_virt()<cr>', desc = 'toggle [m]ath equations' },
    },
  },
  {
    'benlubas/molten-nvim',
    enabled = false,
    build = ':UpdateRemotePlugins',
    init = function()
      vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
    end,
    keys = {
      { '<leader>mi', ':MoltenInit<cr>', desc = '[m]olten [i]nit' },
      {
        '<leader>mv',
        ':<C-u>MoltenEvaluateVisual<cr>',
        mode = 'v',
        desc = 'molten eval visual',
      },
      { '<leader>mr', ':MoltenReevaluateCell<cr>', desc = 'molten re-eval cell' },
    },
  },
  {
    'jmbuhr/otter.nvim',
    dev = false,
    dependencies = {
      {
        'neovim/nvim-lspconfig',
        'nvim-treesitter/nvim-treesitter',
        'hrsh7th/nvim-cmp',
      },
    },
    opts = {
      lsp = {
        hover = {
          border = require('misc.style').border,
        },
      },
      buffers = {
        set_filetype = true,
        write_to_disk = false,
      },
      handle_leading_whitespace = true,
    },
  },
  {
    'L3MON4D3/LuaSnip',
  },
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require 'cmp'
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup {
        formatting = lsp_zero.cmp_format { details = true },
        mapping = cmp.mapping.preset.insert {
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        },
      }
    end,
  },
  --  { -- LSP Configuration & Plugins
  --    'neovim/nvim-lspconfig',
  --    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  --    event = { 'BufReadPre', 'BufNewFile' },
  --    dependencies = {
  --      { 'hrsh7th/cmp-nvim-lsp' },
  --      { 'williamboman/mason-lspconfig.nvim' },
  --    },
  --    config = function()
  --      -- This is where all the LSP shenanigans will live
  --      local lsp_zero = require 'lsp-zero'
  --      lsp_zero.extend_lspconfig()
  --
  --      --- if you want to know more about lsp-zero and mason.nvim
  --      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
  --      lsp_zero.on_attach(function(client, bufnr)
  --        -- see :help lsp-zero-keybindings
  --        -- to learn the available actions
  --        lsp_zero.default_keymaps { buffer = bufnr }
  --      end)
  --
  --      require('mason-lspconfig').setup {
  --        ensure_installed = {
  --          'pyright', -- python
  --          'tsserver', -- js, ts
  --          'html',
  --          'cssls',
  --          'tailwindcss',
  --          'svelte',
  --          'lua_ls',
  --          'graphql',
  --          'emmet_ls',
  --          'prismals',
  --        },
  --        handlers = {
  --          lsp_zero.default_setup,
  --          lua_ls = function()
  --            -- (Optional) Configure lua language server for neovim
  --            local lua_opts = lsp_zero.nvim_lua_ls()
  --            require('lspconfig').lua_ls.setup(lua_opts)
  --          end,
  --        },
  --      }
  --
  --      -- Python environment
  --      local util = require 'lspconfig/util'
  --      local path = util.path
  --      require('lspconfig').pyright.setup {
  --        on_attach = on_attach,
  --        capabilities = capabilities,
  --        filetypes = { 'python' },
  --        before_init = function(_, config)
  --          default_venv_path = path.join(vim.env.HOME, 'virtualenvs', 'venv-nvim', 'bin', 'python')
  --          config.settings.python.pythonPath = default_venv_path
  --        end,
  --      }
  --    end,
  --  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
      { -- nice loading notifications
        -- PERF: but can slow down startup
        'j-hui/fidget.nvim',
        enabled = false,
        opts = {},
      },
      { 'folke/neodev.nvim', opts = {}, enabled = true },
      { 'folke/neoconf.nvim', opts = {}, enabled = false },
    },
    config = function()
      local lspconfig = require 'lspconfig'
      local util = require 'lspconfig.util'

      require('mason').setup()
      require('mason-lspconfig').setup {
        automatic_installation = true,
      }
      require('mason-tool-installer').setup {
        ensure_installed = {
          'black',
          'stylua',
          'shfmt',
          'isort',
          'tree-sitter-cli',
          'jupytext',
        },
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local telescope = require 'telescope.builtin'
          local function map(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          assert(client, 'LSP client not found')

          ---@diagnostic disable-next-line: inject-field
          client.server_capabilities.document_formatting = true

          map('gS', telescope.lsp_document_symbols, '[g]o so [S]ymbols')
          map('gD', telescope.lsp_type_definitions, '[g]o to type [D]efinition')
          map('gd', telescope.lsp_definitions, '[g]o to [d]efinition')
          map('K', '<cmd>lua vim.lsp.buf.hover()<CR>', '[K] hover documentation')
          map('gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', '[g]o to signature [h]elp')
          map('gI', telescope.lsp_implementations, '[g]o to [I]mplementation')
          map('gr', telescope.lsp_references, '[g]o to [r]eferences')
          map('[d', vim.diagnostic.goto_prev, 'previous [d]iagnostic ')
          map(']d', vim.diagnostic.goto_next, 'next [d]iagnostic ')
          map('<leader>ll', vim.lsp.codelens.run, '[l]ens run')
          map('<leader>lR', vim.lsp.buf.rename, '[l]sp [R]ename')
          map('<leader>lf', vim.lsp.buf.format, '[l]sp [f]ormat')
          map('<leader>lq', vim.diagnostic.setqflist, '[l]sp diagnostic [q]uickfix')
        end,
      })

      local lsp_flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 150,
      }
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = require('misc.style').border })
      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = require('misc.style').border })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- also needs:
      -- $home/.config/marksman/config.toml :
      -- [core]
      -- markdown.file_extensions = ["md", "markdown", "qmd"]
      lspconfig.marksman.setup {
        capabilities = capabilities,
        filetypes = { 'markdown', 'quarto' },
        root_dir = util.root_pattern('.git', '.marksman.toml', '_quarto.yml'),
      }

      -- lspconfig.r_language_server.setup {
      --   capabilities = capabilities,
      --   flags = lsp_flags,
      --   settings = {
      --     r = {
      --       lsp = {
      --         rich_documentation = false,
      --       },
      --     },
      --   },
      -- }

      lspconfig.cssls.setup {
        capabilities = capabilities,
        flags = lsp_flags,
      }

      lspconfig.html.setup {
        capabilities = capabilities,
        flags = lsp_flags,
      }

      lspconfig.emmet_language_server.setup {
        capabilities = capabilities,
        flags = lsp_flags,
      }

      lspconfig.yamlls.setup {
        capabilities = capabilities,
        flags = lsp_flags,
        settings = {
          yaml = {
            schemaStore = {
              enable = true,
              url = '',
            },
          },
        },
      }

      lspconfig.dotls.setup {
        capabilities = capabilities,
        flags = lsp_flags,
      }

      lspconfig.tsserver.setup {
        capabilities = capabilities,
        flags = lsp_flags,
        filetypes = { 'js', 'javascript', 'typescript', 'ojs' },
      }

      local function get_quarto_resource_path()
        local function strsplit(s, delimiter)
          local result = {}
          for match in (s .. delimiter):gmatch('(.-)' .. delimiter) do
            table.insert(result, match)
          end
          return result
        end

        local f = assert(io.popen('quarto --paths', 'r'))
        local s = assert(f:read '*a')
        f:close()
        return strsplit(s, '\n')[2]
      end

      local lua_library_files = vim.api.nvim_get_runtime_file('', true)
      local lua_plugin_paths = {}
      local resource_path = get_quarto_resource_path()
      if resource_path == nil then
        vim.notify_once 'quarto not found, lua library files not loaded'
      else
        table.insert(lua_library_files, resource_path .. '/lua-types')
        table.insert(lua_plugin_paths, resource_path .. '/lua-plugin/plugin.lua')
      end

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        flags = lsp_flags,
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            runtime = {
              version = 'LuaJIT',
              plugin = lua_plugin_paths,
            },
            diagnostics = {
              globals = { 'vim', 'quarto', 'pandoc', 'io', 'string', 'print', 'require', 'table' },
              disable = { 'trailing-space' },
            },
            workspace = {
              library = lua_library_files,
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      lspconfig.julials.setup {
        capabilities = capabilities,
        flags = lsp_flags,
      }

      lspconfig.bashls.setup {
        capabilities = capabilities,
        flags = lsp_flags,
        filetypes = { 'sh', 'bash' },
      }

      -- Add additional languages here.
      -- See `:h lspconfig-all` for the configuration.
      -- Like e.g. Haskell:
      -- lspconfig.hls.setup {
      --   capabilities = capabilities,
      --   flags = lsp_flags
      -- }

      -- lspconfig.clangd.setup {
      --   capabilities = capabilities,
      --   flags = lsp_flags,
      -- }

      -- lspconfig.rust_analyzer.setup{
      --   capabilities = capabilities,
      --   settings = {
      --     ['rust-analyzer'] = {
      --       diagnostics = {
      --         enable = false;
      --       }
      --     }
      --   }
      -- }

      -- See https://github.com/neovim/neovim/issues/23291
      -- disable lsp watcher.
      -- Too lags on linux for python projects
      -- because pyright and nvim both create too many watchers otherwise
      if capabilities.workspace == nil then
        capabilities.workspace = {}
        capabilities.workspace.didChangeWatchedFiles = {}
      end
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
      local path = util.path

      lspconfig.pyright.setup {
        capabilities = capabilities,
        flags = lsp_flags,
        filetype = { 'python' },
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'workspace',
            },
          },
        },
        before_init = function(_, config)
          default_venv_path = path.join(vim.env.HOME, 'virtualenvs', 'venv_nvim', 'bin', 'python')
          config.settings.python.pythonPath = default_venv_path
        end,
        root_dir = function(fname)
          return util.root_pattern('.git', 'setup.py', 'setup.cfg', 'pyproject.toml', 'requirements.txt')(fname) or util.path.dirname(fname)
        end,
      }
    end,
  },
  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
--
--
-- local map = vim.keymap.set
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<CR>', { desc = 'Nvimtree toggle window' })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'Nvimtree toggle window' })
vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', { desc = 'markdown preview toggle' })
vim.keymap.set('n', '<leader>qp', '<cmd>wQuartoPreview<CR>', { desc = 'quarto preview toggle' })
vim.keymap.set({ 'n', 'v' }, '<leader>/', '<cmd>CommentToggle<CR>', { desc = 'Comment toggle' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y"]], { desc = 'Comment toggle' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql' },
  command = [[setlocal omnifunc=vim_daddod_completion#omni]],
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "sql",},
--   callback = function()
--     vim.schedule(db_completion)
--   end
-- })
