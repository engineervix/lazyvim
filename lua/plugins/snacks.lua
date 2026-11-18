-- wrap long lines in the picker's file preview pane
-- (picker.win.preview is passed through to Snacks.win, see
-- snacks.nvim lua/snacks/picker/core/preview.lua)
return {
  {
    "snacks.nvim",
    opts = {
      picker = {
        -- show hidden files by default (<a-h>/H toggles them off); ignored stays
        -- off, toggle with <a-i>/I. explorer is the exception: hidden + ignored.
        -- sources inherit this unless they set their own (files does), so
        -- files is repeated below. .git/.DS_Store stay excluded.
        -- explorer matches globs against absolute paths, hence "**/"
        hidden = true,
        sources = {
          files = { hidden = true, exclude = { ".git", ".DS_Store" } },
          grep = { exclude = { ".git", ".DS_Store" } },
          grep_word = { exclude = { ".git", ".DS_Store" } },
          explorer = { hidden = true, ignored = true, exclude ={ "**/.git", "**/.DS_Store" } },
        },
        -- shrink the margin around the default float (stock: 0.8 x 0.8, see
        -- https://github.com/folke/snacks.nvim/blob/882c996c/lua/snacks/picker/config/layouts.lua#L5-L10)
        layouts = {
          default = { layout = { width = 0.9, height = 0.9 } },
        },
        win = {
          preview = {
            wo = { wrap = true, linebreak = true, breakindent = true },
          },
        },
      },
    },
  },
}
