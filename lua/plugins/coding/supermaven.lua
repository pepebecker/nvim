return {
  {
    "supermaven-inc/supermaven-nvim",
    build = ":SupermavenUseFree",
    opts = {
      keymaps = {
        accept_suggestion = "<C-]>",
        clear_suggestion = "<C-[>",
        accept_word = "<C-j>",
      },
    },
    init = function()
      vim.keymap.set("n", "<leader>ai", "<cmd>SupermavenToggle<cr>", { desc = "Toggle Supermaven" })
    end,
  },
  {
    "lualine.nvim",
    opts = function(_, opts)
      local sm = require("supermaven-nvim.api")
      table.insert(opts.sections.lualine_x, 2, {
        function()
          return ""
        end,
        cond = function()
          return sm.is_running()
        end,
        color = function()
          return { fg = "#66CCFF" }
        end,
      })
    end,
  },
}
