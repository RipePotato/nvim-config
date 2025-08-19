function ColorMyPencils(color)
	color = color or "everforest"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local uname = vim.loop.os_uname().sysname

if uname == "Darwin" then 
    -- For the macbook
    return {
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
            config = function()
                vim.cmd.colorscheme("catppuccin-macchiato");
                ColorMyPencils();
            end,
        }
    }

elseif uname == "Linux" then
    -- For the Linux
    return {
        {
            "neanias/everforest-nvim",
            version = false,
            lazy = false,
            priority = 1000, -- make sure to load this before all the other start plugins
            -- Optional; default configuration will be used if setup isn't called.
            config = function()
                require("everforest").setup({
                    -- Your config here
                })
                ColorMyPencils();
            end,
        }
    }
end
