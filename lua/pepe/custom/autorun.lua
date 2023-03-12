vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("pepe-automagic", {clear = true}),
  pattern = "*.js",
  callback = function()
    local focused_bufnr = vim.api.nvim_get_current_buf()
    local file_name = vim.api.nvim_buf_get_name(focused_bufnr)
    local output_name = file_name .. ' output'

    -- check if the output buffer already exists
    local output_bufnr = vim.fn.bufnr(output_name)
    if output_bufnr ~= -1 then
      -- if it does, switch to it
      vim.api.nvim_set_current_buf(output_bufnr)
      vim.api.nvim_buf_set_lines(output_bufnr, 0, 1, false, {})
    else
      -- if it doesn't, create it
      vim.api.nvim_command('vnew')
      output_bufnr = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_name(output_bufnr, output_name)
    end
    vim.api.nvim_buf_set_option(output_bufnr, 'buflisted', true)

    local append_data = function(_, data)
      if data then
        vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
      end
    end

    vim.fn.jobstart({'node', file_name}, {
      stdout_buffered = true,
      on_stdout = append_data,
      on_stderr = append_data,
    })
  end,
})

