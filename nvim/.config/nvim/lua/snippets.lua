local ls = require "luasnip"
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("c", {
  ls.snippet("!", fmt(
    [[
    #include <stdio.h>

    int main(){{
      {}

      return 0;
    }}

    ]], {ls.insert_node(0)}
  )),
})


