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
  s({ trig = "now", name = "Current date", dscr = "Insert the current date" }, {
    p(os.date, "%Y-%m-%d"),
  }),

   s("trig", c(1, {
    t"some text", -- textNodes are just stopped at.
      i(nil, "some text"), -- likewise.
      sn(nil, {t"some text"}), -- this will not work!
      sn(nil, {i(1), t"popo"}) -- this will.
   })),

  s("parent_change", {
    c(1, {
      sn(nil, { t("("), r(1, "user_text"), t(")") }),
      sn(nil, { t("["), r(1, "user_text"), t("]") }),
      sn(nil, { t("{"), r(1, "user_text"), t("}") }),
    }),
  }, {
    stored = {
      ["user_text"] = i(1, "default_text")
    }
  }),

  s("trig2", sn(1, {
    t("basically just text "),
    i(1, "And an insertNode.")
  }))

}

return snippets
