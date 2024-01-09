-- local function my_on_attach(bufnr)
--   local api = require "nvim-tree.api"
--
--   -- local function opts(desc)
--   --   return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--   -- end
--
--   -- default mappings
--   api.config.mappings.default_on_attach(bufnr)
--
--   -- custom mappings
--   -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
--   vim.keymap.set('n', 'l',     api.tree.open)
-- end
--
--
local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "eslint_d",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  -- on_attach = my_on_attach,
}

M.catppuccin = {
  styles = {
    -- comments = { "italic" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = { "italic" },
    keywords = {},
    strings = {},
    variables = { "italic" },
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = { "italic" },
  },
}

return M
