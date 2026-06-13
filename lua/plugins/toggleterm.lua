return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    cmd = { "ToggleTerm", "TermNew", "TermSelect" },
    opts = {
      direction = "float",
      close_on_exit = true,
      float_opts = {
        border = "curved",
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
      local terminal_api = require("toggleterm.terminal")
      local Terminal = terminal_api.Terminal

      local function ensure_terminal(id)
        return terminal_api.get(id, true) or Terminal:new({
          count = id,
          direction = "float",
        })
      end

      local function next_terminal_id()
        local terms = terminal_api.get_all(true)
        local id = 1

        for _, term in ipairs(terms) do
          if term.id == id then
            id = id + 1
          elseif term.id > id then
            break
          end
        end

        return id
      end

      local function terminal_status(term)
        if term:is_open() then
          return "Visible"
        end

        if term.bufnr and vim.api.nvim_buf_is_valid(term.bufnr) then
          local job = term.job_id and vim.fn.jobwait({ term.job_id }, 0)[1] or nil
          if job == -1 then
            return "Hidden"
          end
        end

        return "Closed"
      end

      vim.keymap.set("n", "<leader>tt", function()
        ensure_terminal(1):toggle()
      end, { desc = "Toggle Terminal" })

      vim.keymap.set("n", "<leader>tn", function()
        local id = next_terminal_id()
        ensure_terminal(id):toggle()
      end, { desc = "New Terminal" })

      vim.keymap.set("n", "<leader>to", function()
        local terms = terminal_api.get_all(true)
        local choices = {}

        for _, term in ipairs(terms) do
          local status = terminal_status(term)
          if status ~= "Closed" then
            table.insert(choices, {
              id = term.id,
              label = string.format("Terminal %d  [%s]", term.id, status),
            })
          end
        end

        if #choices == 0 then
          vim.notify("No live terminals right now", vim.log.levels.INFO)
          return
        end

        table.sort(choices, function(a, b)
          return a.id < b.id
        end)

        vim.ui.select(choices, {
          prompt = "Pick terminal",
          format_item = function(item)
            return item.label
          end,
        }, function(choice)
          if choice then
            ensure_terminal(choice.id):toggle()
          end
        end)
      end, { desc = "Pick Terminal" })
    end,
  },
}
