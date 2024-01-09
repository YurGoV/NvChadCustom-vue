-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  Operator = {
    italic = true,
  },
  -- Define = { italic = true },
  Variable = { italic = true },
  -- Type = { italic = true },
  Function = { italic = true },
  Keyword = { italic = true },
  Type = { italic = true },
  SpecialComment = { italic = true },
  TSAttribute = { italic = true },
  TSParameter = { italic = true },
  TSLabel = { italic = true },
  TSVariableBuiltin = { italic = true },
  TSTagAttribute = { italic = true },
}


---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
