local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local i = ls.insert_node

local sn = ls.snippet_node
local d = ls.dynamic_node

local snippets = {
  s({ trig = "clg", name = "Log", dscr = "Log" }, { t "console.log(", i(1), t ");", i(2) }),

  s(
    "fmt2",
    fmt(
      [[
    foo({1}, {3}) {{
        return {2} * {4}
      }}
    ]],
      {
        i(1, "x"),
        rep(1),
        i(2, "y"),
        rep(2),
      }
    )
  ),

  -- s(
  --   "for",
  --   fmt(
  --     [[
  --       for(let {1} = 0; {2} < {3}.length; {4}++) {{
  --       }}
  --     ]],
  --     {
  --       i(1, "i"),
  --       rep(1),
  --       -- i(2, "array"),
  --       -- rep(2),
  --     }
  --   )
  -- ),

}

return snippets
