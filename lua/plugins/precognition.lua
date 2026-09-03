return {
  "tris203/precognition.nvim",
  opts = {
    -- Off by default; toggle on with <leader>uP while drilling motions,
    -- rather than showing hint virtual text on every line all the time.
    startVisible = false,
  },
  keys = {
    {
      "<leader>uP",
      function()
        require("precognition").toggle()
      end,
      desc = "Precognition Hints",
    },
  },
}
