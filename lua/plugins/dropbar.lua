return {
  {
    "Bekaboo/dropbar.nvim",
    event = "BufReadPost",
    config = function()
      local dropbar_api = require("dropbar.api")

      vim.keymap.set("n", "<leader>;", dropbar_api.pick, { desc = "Pick Breadcrumb" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go To Context Start" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Go To Next Context" })
    end,
  },
}
