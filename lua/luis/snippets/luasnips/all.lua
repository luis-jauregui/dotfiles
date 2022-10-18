local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep
local d = ls.dynamic_node
local f = ls.function_node
local p = require("luasnip.extras").partial
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

local snippets = {
  s({ trig = "ymd", name = "Current date", dscr = "Insert the current date" }, {
    p(os.date, "%Y-%m-%d"),
  }),
}

return snippets
