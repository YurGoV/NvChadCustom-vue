---@type MappingsTable
local M = {}

M.general = { n = { [";"] = { ":", "enter command mode", opts = { nowait = true } } } }

-- more keybinds!
M.mymap = {
  n = {
    ["<leader>w"] = { ":w<CR>", "write to file", opts = { nowait = true } },


    -- nvim tree focus
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },

    -- lsp
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    -- todo
    ["<leader>ft"] = { "<cmd>TodoTelescope<CR>", "Find Todo" },
  },

  i = {
    ["fg"] = { "<Esc>la", "go to right over symbol", opts = { nowait = true } },
  },
  --   n = {
  --     ["<C-t>"] = {
  --     function()
  -- dkdkd        require 'nvim-tree.api'.tree.change_root_to_parent()
  --       end,
  --       opts = { desc = "nvim-tree: " .. "Up", buffer = bufnr, noremap = true, silent = true, nowait = true },
  --       "change_root_to_parent" },
  --   },
}

M.nvterm = {
  n = {
    -- toggle in normal mode
    ["<leader>tf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },
  t = {
    -- toggle in normal mode
    ["<leader>tf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<leader>th"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },
}

M.dap = {
  n = {
    ["<leader>du"] = {
      function()
        require("dapui").toggle()
      end,
      "Dedug UI",
    },
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Breakpoint",
    },
    ["<leader>ds"] = {
      function()
        require("dap").continue()
      end,
      "Start",
    },
    ["<leader>dn"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },
  },
}
-- local hop = require "hop"
--
-- -- Set up the plugin
-- require("hop").setup {
--   keys = "etovxqpdygfblzhckisuran",
-- }
--
-- local function hop_after_cursor()
--   hop.hint_char1 { direction = hop.HintDirection.AFTER_CURSOR, current_line_only = true }
-- end
--
-- local function hop_before_cursor()
--   hop.hint_char1 { direction = hop.HintDirection.BEFORE_CURSOR, current_line_only = true }
-- end
--
-- local function hop_after_cursor_offset()
--   hop.hint_char1 { direction = hop.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
-- end
--
-- local function hop_before_cursor_offset()
--   hop.hint_char1 { direction = hop.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
-- end
--
--
-- local mappings = {
--   ["f"] = hop_after_cursor,
--   ["F"] = hop_before_cursor,
--   ["t"] = hop_after_cursor_offset,
--   ["T"] = hop_before_cursor_offset,
-- }
--
-- M.hop = {
--   n = mappings
-- }
return M
