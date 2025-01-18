return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    opts.ui = opts.ui or {}
    opts.ui.border = "rounded"
  end,
}
