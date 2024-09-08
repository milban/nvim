local mapKey = require("utils.keyMapper").mapKey

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function ()
    require('toggleterm').setup({
      open_mapping = '<C-t>'
    })

    mapKey('<esc>', '<C-\\><C-n>', 't')
  end
}
