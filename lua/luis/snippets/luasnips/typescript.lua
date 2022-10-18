local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local i = ls.insert_node

local snippets = {
  s("clg", { t "console.log(", i(1), t ");", i(2) }),

}

return snippets
