return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      -- these are installed by mason
      -- in the lsp.lua file
      formatters_by_ft = {
        lua = { 'stylua' },
        yaml = { 'yamlfmt' },
        python = { 'isort', 'black' },
      },
    },
  },
}
