return {
  "coder/claudecode.nvim",
  -- Override the default LazyVim ai.claudecode extra options.
  -- Keybindings come from the extra itself; we only need to change
  -- how the Claude terminal is launched.
  opts = {
    -- vim.fn.expand is required here: a bare "~/..." string is not
    -- expanded when passed as a table arg to jobstart.
    terminal_cmd = vim.fn.expand("~/.local/bin/claude"),
    git_repo_cwd = true,
    terminal = {
      -- Run Claude in an external kitty pane instead of a Neovim
      -- floating/split terminal, so it behaves like a real IDE
      -- side panel (own scrollback, resizable, survives :qa).
      provider = "external",
      provider_opts = {
        -- Requires kitty.conf: `allow_remote_control yes` and
        -- `listen_on unix:/tmp/kitty` (full kitty restart to apply).
        external_terminal_cmd = function(cmd, env)
          local args = { "kitty", "@", "launch", "--location=vsplit", "--cwd=current" }
          for k, v in pairs(env or {}) do
            table.insert(args, "--env")
            table.insert(args, k .. "=" .. v)
          end
          -- cmd arrives as a single string; split it back into argv
          -- entries for kitty's launch command.
          for part in cmd:gmatch("%S+") do
            table.insert(args, part)
          end
          return args
        end,
      },
    },
    diff_opts = {
      layout = "vertical",
      open_in_new_tab = true,
    },
  },
}
