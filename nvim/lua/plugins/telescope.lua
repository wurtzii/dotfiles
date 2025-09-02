return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false, -- telescope did only one release, so use HEAD for now
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = (build_cmd ~= "cmake") and "make"
			or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			enabled = build_cmd ~= nil,
			config = function(plugin)
				LazyVim.on_load("telescope.nvim", function()
					local ok, err = pcall(require("telescope").load_extension, "fzf")
					if not ok then
						local lib = plugin.dir .. "/build/libfzf." .. (LazyVim.is_win() and "dll" or "so")
						if not vim.uv.fs_stat(lib) then
							LazyVim.warn("`telescope-fzf-native.nvim` not built. Rebuilding...")
							require("lazy").build({ plugins = { plugin }, show = false }):wait(function()
								LazyVim.info("Rebuilding `telescope-fzf-native.nvim` done.\nPlease restart Neovim.")
							end)
						else
							LazyVim.error("Failed to load `telescope-fzf-native.nvim`:\n" .. err)
						end
					end
				end)
			end,
		},
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Switch Buffer", },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Switch Buffer", },
		{ "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Switch Buffer", },
		{ "<leader>ss", "<cmd>Telescope spell_suggest<cr>", desc = "Switch Buffer", },
		{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Switch Buffer", },
	},
}
