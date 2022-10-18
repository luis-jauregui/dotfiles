local ok, dressing = pcall(require, "dressing")
if not ok then
    return
end

dressing.setup({
  input = {
    relative = "editor",
    winblend = 100,
    mappings = {
      n = {
        ["q"]    = "Close",
        ["<CR>"] = "Confirm",
      },
    },
  }
})
