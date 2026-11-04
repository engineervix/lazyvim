-- add a key to copy path(s) relative to cwd (project root), since the
-- built-in `y` (explorer_yank) only copies the absolute path
--
-- reference (snacks.nvim @ 882c996c, pinned via lazy-lock.json):
--  default explorer keymap, `y` = explorer_yank:
--    https://github.com/folke/snacks.nvim/blob/882c996c/lua/snacks/picker/config/sources.lua#L90
--  explorer_yank implementation (absolute path via Snacks.picker.util.path):
--    https://github.com/folke/snacks.nvim/blob/882c996c/lua/snacks/explorer/actions.lua#L129
--  Snacks.picker.util.path:
--    https://github.com/folke/snacks.nvim/blob/882c996c/lua/snacks/picker/util/init.lua#L10
--
-- NOTE: a raw function in `keys["Y"] = { fn, ... }` gets called with the
-- *window*, not the picker (see win.lua `is_action` check below) - it must
-- be registered as a named action under `picker.actions` and referenced by
-- string instead:
--    https://github.com/folke/snacks.nvim/blob/882c996c/lua/snacks/win.lua#L986
return {
  {
    "snacks.nvim",
    opts = {
      picker = {
        actions = {
          explorer_yank_relative = function(picker)
            local cwd = picker:cwd()
            if vim.fn.mode():find("^[vV]") then
              picker.list:select()
            end
            local files = {}
            for _, item in ipairs(picker:selected({ fallback = true })) do
              local path = Snacks.picker.util.path(item)
              local rel = path and path:sub(1, #cwd + 1) == cwd .. "/" and path:sub(#cwd + 2) or path
              table.insert(files, rel)
            end
            picker.list:set_selected()
            vim.fn.setreg(vim.v.register or "+", table.concat(files, "\n"), "l")
            Snacks.notify.info("Yanked " .. #files .. " relative path(s)")
          end,
        },
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["Y"] = { "explorer_yank_relative", mode = { "n", "x" } },
                },
              },
            },
          },
        },
      },
    },
  },
}
