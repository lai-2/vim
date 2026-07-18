return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			-- Enter / o: mở file trong tab mới; nếu file đã mở thì nhảy tới tab đó
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				-- giữ toàn bộ mapping mặc định
				api.config.mappings.default_on_attach(bufnr)

				local function open_tab_drop()
					local node = api.tree.get_node_under_cursor()
					if not node then
						return
					end
					-- thư mục và entry "..": giữ hành vi expand/điều hướng mặc định
					if node.type == "directory" or node.name == ".." then
						api.node.open.edit()
						return
					end
					-- ":tab drop" = mở tab mới, hoặc nhảy tới tab đã có nếu file đang mở
					vim.cmd("tab drop " .. vim.fn.fnameescape(node.absolute_path))
				end

				local function opts(desc)
					return { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = "nvim-tree: " .. desc }
				end
				vim.keymap.set("n", "<CR>", open_tab_drop, opts("Open (tab drop)"))
				vim.keymap.set("n", "o", open_tab_drop, opts("Open (tab drop)"))
			end,
			view = {
				width = 50,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
			tab = {
				sync = {
					open = true,
					close = true,
				},
			},
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ef", function()
			require("nvim-tree.api").tree.open({ find_file = true })
		end, { desc = "Focus file explorer and reveal current file" }) -- focus file explorer and jump to current file
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
		keymap.set(
			"n",
			"<leader>et",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
	end,
}
