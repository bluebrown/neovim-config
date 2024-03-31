-- fix the clipboard in wsl, this requires
-- clip.exe to be installed in windows
-- https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/clip

-- disable unnamedplus
if vim.fn.has 'win32' == 1 then
  vim.cmd [[
    let g:clipboard = {
    \   'name': 'WslClipboard',
    \   'copy': {
    \      '+': 'clip.exe',
    \      '*': 'clip.exe',
    \    },
    \   'paste': {
    \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \   },
    \   'cache_enabled': 0,
    \ }
  ]]
end

vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd('InsertEnter', {
  desc = 'Use absolute number in insert mode',
  group = vim.api.nvim_create_augroup('bluebrown-number-absolute', { clear = true }),
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  desc = 'Use relative number in normal mode',
  group = vim.api.nvim_create_augroup('bluebrown-number-relative', { clear = true }),
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = true
  end,
})
