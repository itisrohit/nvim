return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      notify.setup({
        timeout = 2500,
        render = "compact",
        stages = "fade_in_slide_out",
      })

      vim.notify = notify
    end,
  },
}
