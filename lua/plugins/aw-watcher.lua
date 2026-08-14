return {
  "lowitea/aw-watcher.nvim",
  -- Needs to track every buffer/window event for the whole session, same
  -- reasoning as wakatime.lua's lazy = false — nothing lazy-loads this.
  lazy = false,
  -- Repo is "aw-watcher.nvim" (hyphen) but the lua module is "aw_watcher"
  -- (underscore); spelling it out avoids relying on lazy.nvim's inference.
  main = "aw_watcher",
  opts = {
    aw_server = {
      -- Matches the aw-server-rust bundled with awatcher (systemd unit
      -- `awatcher.service`), already listening on the default host/port.
      host = "127.0.0.1",
      port = 5600,
    },
  },
}
