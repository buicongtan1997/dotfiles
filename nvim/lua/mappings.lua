require "nvchad.mappings"

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local bind = vim.keymap.set
local opts = { silent = true }

local cmd = vim.api.nvim_create_user_command

bind({ "n", "v" }, "<Space>", "<Nop>")
vim.g.mapleader = " "

bind("n", "<Leader>w", ":w<CR>", opts)
bind("n", "<Leader>nh", ":noh<CR><c-l>", opts)
bind("n", "<Leader>a", ":keepjumps normal! ggVG<CR>", opts)
bind("n", "[b", ":bprevious<CR>", opts)
bind("n", "]b", ":bnext<CR>", opts)
bind("n", "]q", ":cprevious<CR>", opts)
bind("n", "[q", ":cnext<CR>", opts)

cmd("W", "w", { bang = true })
cmd("Q", "qa!", { bang = true })
cmd("Qa", "qa!", { bang = true })

-- vim-fugitive
bind("n", "<Leader>gt", ":Git commit -v -q %:p<CR>", opts)

-- nvim-tree
bind("n", "<Leader>d", ":NvimTreeToggle<CR>", opts)

-- split windown
bind("n", "<Leader>v", ":vsplit<CR>", opts)
bind("n", "<Leader>h", ":split<CR>", opts)

-- telescope
bind("n", "<Leader>pb", ":Telescope buffers<CR>", opts)
bind("n", "<Leader>pf", function()
  require("telescope.builtin").find_files { hidden = true, previewer = false }
end, opts)
bind("n", "<Leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, opts)
bind("n", "\\\\", ":Telescope grep_string<CR>", opts)
bind("n", "\\", ":Telescope live_grep<CR>", opts)
bind("n", "<Leader>gy", ":Telescope git_stash<CR>", opts)
bind("n", "<Leader>gb", ":Telescope git_bcommits<CR>", opts)
bind("n", "<Leader>fs", ":Telescope treesitter<CR>", opts)

bind("n", "ld", ":Telescope diagnostics<CR>", opts)
bind("n", "<Leader>e", vim.diagnostic.open_float, opts)
bind("n", "[d", vim.diagnostic.goto_prev, opts)
bind("n", "]d", vim.diagnostic.goto_next, opts)

vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })

local nvim_tmux_nav = require "nvim-tmux-navigation"

nvim_tmux_nav.setup {
  disable_when_zoomed = false, -- defaults to false
}

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
