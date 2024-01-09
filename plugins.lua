local overrides = require "custom.configs.overrides"
-- local function my_on_attach(bufnr)
--   require "nvim-tree.api".config.mappings.default_on_attach(bufnr)
-- end

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  }, -- override plugin configs
  { "williamboman/mason.nvim", opts = overrides.mason },

  -- orig
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
  -- custom
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = {
  --       -- defaults
  --       "vim",
  --       "lua",
  --
  --       -- web dev
  --       "html",
  --       "css",
  --       "javascript",
  --       "typescript",
  --       "tsx",
  --       "json",
  --       -- "vue", "svelte",
  --
  --       -- low level
  --       -- "c",
  --       -- "zig",
  --     },
  --   },
  -- },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    --  config = function()
    --  require("nvim-tree").setup(
    --   {vim.keymap.set('n', '?', api.tree.toggle_help,  opts('Help'))}
    --   )
    -- end,
  }, -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local ok, dap = pcall(require, "dap")
      if not ok then
        return
      end
      dap.configurations.typescript = {
        {
          type = "node2",
          name = "node attach",
          request = "attach",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
        },
      }
      dap.adapters.node2 = {
        type = "executable",
        command = "node-debug2-adapter",
        args = {},
      }
    end,
    dependencies = {
      "mxsdev/nvim-dap-vscode-js",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()

      local dap, dapui = require "dap", require "dapui"

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open {}
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close {}
      end
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  { "sindrets/diffview.nvim", lazy = false },
  -- {
  --   "ggandor/leap.nvim",
  --   lazy = false,
  --   config = function()
  --     require("leap").add_default_mappings(true)
  --   end,
  -- },
  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
  },
  -- { "phaazon/hop.nvim" },
  {
    "smoka7/hop.nvim",
    keys = {
      {
        ",",
        function()
          require("hop").hint_words()
        end,
        mode = { "n", "x", "o" },
      },
      {
        "m",
        function()
          require("hop").hint_char2()
        end,
        mode = { "n", "x", "o" },
      },
      {
        "f",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            -- direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
            -- current_line_only = true,
          }
        end,
        mode = { "n", "x", "o" },
      },
      {
        "F",
        function()
          -- require("hop").hint_char1 {
          --   direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          --   current_line_only = true,
          -- }
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            -- current_line_only = true,
          }
        end,
        mode = { "n", "x", "o" },
      },
      {
        "t",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.AFTER_CURSOR,
            -- current_line_only = true,
            hint_offset = -1,
          }
        end,
        mode = { "n", "x", "o" },
      },
      {
        "T",
        function()
          require("hop").hint_char1 {
            direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
            -- current_line_only = true,
            hint_offset = -1,
          }
        end,
        mode = { "n", "x", "o" },
      },
    },
    opts = {
      multi_windows = true,
      keys = "htnsueoaidgcrlypmbkjvx",
      uppercase_labels = true,
      -- reverse_distribution = true,
    },
  },
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup {
        terminals = {
          shell = vim.o.shell,
          list = {},
          type_opts = {
            float = {
              relative = "editor",
              row = 0.1,
              col = 0.1,
              width = 0.8,
              height = 0.7,
              border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.3 },
            vertical = { location = "rightbelow", split_ratio = 0.25 },
          },
        },
        behavior = {
          autoclose_on_quit = {
            enabled = false,
            confirm = true,
          },
          close_on_exit = true,
          auto_insert = true,
        },
      }
    end,
  },
  -- TO DELETE
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup()

      -- or setup with your own config (see Install > Configuration in Readme)
      -- require("gp").setup(conf)

      -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    end,
  },
  -- {
  --   "Exafunction/codeium.vim",
  --   lazy = false,
  -- },

  -- {
  -- 	"catppuccin/nvim",
  -- 	name = "catppuccin",
  -- 	opts = {
  -- 		integrations = {
  --       treesitter = true,
  -- 			nvimtree = false,
  -- 			ts_rainbow = false,
  -- 			aerial = true,
  -- 			dap = { enabled = true, enable_ui = true },
  -- 			mason = true,
  -- 			neotree = true,
  -- 			notify = true,
  -- 			semantic_tokens = true,
  -- 			symbols_outline = true,
  -- 			telescope = true,
  -- 			which_key = true,
  -- 		},
  -- 		styles = {
  -- 			-- comments = { "italic" }, -- Change the style of comments
  -- 			conditionals = { "italic" },
  -- 			loops = {},
  -- 			functions = { "italic" },
  -- 			keywords = {},
  -- 			strings = {},
  -- 			variables = { "italic" },
  -- 			numbers = {},
  -- 			booleans = {},
  -- 			properties = {},
  -- 			types = {},
  -- 			operators = { "italic" },
  -- 		},
  -- 		color_overrides = {
  -- 			mocha = {
  -- 				base = "#000000",
  -- 				mantle = "#000000",
  -- 				crust = "#000000",
  -- 			},
  -- 		},
  -- 	},
  -- },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
