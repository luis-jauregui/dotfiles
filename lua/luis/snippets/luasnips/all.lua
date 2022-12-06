local ls = require "luasnip"
local s = ls.snippet
local p = require("luasnip.extras").partial

local snippets = {

  s({ trig = "now", name = "Current date", dscr = "Insert the current date" }, {
    p(os.date, "%Y-%m-%d"),
  })

}

return snippets
