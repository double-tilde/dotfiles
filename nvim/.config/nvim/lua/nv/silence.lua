-- Silence E468
-- https://github.com/neovim/neovim/issues/24059

local function norm_unmapped(c)
	return vim.cmd({ cmd = "norm", args = { c }, bang = true })
end
vim.keymap.set("n", "n", function()
	pcall(norm_unmapped, "n")
end)
vim.keymap.set("n", "N", function()
	pcall(norm_unmapped, "N")
end)

-- This monstrosity manually recreates the behavior of the default / search command
-- with regard to incremental highlighting, cursor placement, and behavior upon
-- cancelling out of the search before hitting enter.

-- It does this all this for the purpose of avoiding the error message that normally
-- results when the search yields no results, which doesn't work well with cmdheight=0.
local function search_cmd_with_manual_incsearch_highlight()
  local function set_search( what )
    vim.fn.setreg( '/', what )
    vim.o.hls = true
    vim.cmd[[redraw!]]
  end
  local GROUP = 'ManualIncSearch'
  local old_search = vim.fn.getreg( '/' )
  local old_v_hlsearch = vim.v.hlsearch
  vim.api.nvim_create_autocmd( 'CmdLineChanged', {
    group=vim.api.nvim_create_augroup( GROUP, { clear=true } ),
    callback=function() set_search( vim.fn.getcmdline() ) end,
  } )
  local input = vim.fn.input( '/' )
  vim.api.nvim_del_augroup_by_name( GROUP )
  if #input > 0 then
    set_search( input )
    vim.cmd.normal( 'n' )
    return
  end
  -- The search was cancelled, so try to restore the state to
  -- what it was previously, both with regard to the search
  -- phrase and whether highlighting was visible or not.
  vim.fn.setreg( '/', old_search )
  if old_v_hlsearch == 0 then
    vim.cmd.nohlsearch()
  else
    vim.o.hls = true
  end
  vim.cmd[[redraw!]]
end

vim.keymap.set( 'n', '/', search_cmd_with_manual_incsearch_highlight, { silent=true } )
