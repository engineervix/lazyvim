return {
  "tris203/precognition.nvim",
  opts = {
    -- Off by default; toggle on with <leader>up while drilling motions,
    -- rather than showing hint virtual text on every line all the time.
    startVisible = false,
  },
  keys = {
    {
      "<leader>up",
      function()
        require("precognition").toggle()
      end,
      desc = "Precognition Hints",
    },
  },
}
