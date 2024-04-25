local M = {}

M.cd = function(path)
    local _utils = require("telescope._extensions.project.utils")
    print("CD -> " .. path)
    _utils.change_project_dir(path)
    vim.cmd("Alpha")
end

M.shorten_path = function(path)
    local target_length = 35
    path = path or ""
    path = path:gsub("\\", "/"):gsub("//", "/")
    local pattern = "[^/]+/[^/]+$"
    local result = string.sub(path, string.find(path, pattern) or 1)
    if #result > target_length then
        result = result:gsub("[^/]+/", "")
        if #result > target_length then
            result = result:sub(0, target_length - 3) .. "..."
        end
    end
    return result
end

function tbl_length(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

M.get_visual_selection = function()
  -- this will exit visual mode
  -- use 'gv' to reselect the text
  local _, csrow, cscol, cerow, cecol
  local mode = vim.fn.mode()
  if mode == "v" or mode == "V" or mode == "" then
    -- if we are in visual mode use the live position
    _, csrow, cscol, _ = unpack(vim.fn.getpos("."))
    _, cerow, cecol, _ = unpack(vim.fn.getpos("v"))
    if mode == "V" then
      -- visual line doesn't provide columns
      cscol, cecol = 0, 999
    end
    -- exit visual mode
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Esc>",
        true, false, true), "n", true)
  else
    -- otherwise, use the last known visual position
    _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
    _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
  end
  -- swap vars if needed
  if cerow < csrow then csrow, cerow = cerow, csrow end
  if cecol < cscol then cscol, cecol = cecol, cscol end
  local lines = vim.fn.getline(csrow, cerow)
  -- local n = cerow-csrow+1
  local n = tbl_length(lines)
  if n <= 0 then return "" end
  lines[n] = string.sub(lines[n], 1, cecol)
  lines[1] = string.sub(lines[1], cscol)
  return table.concat(lines, "\n")
end

return M
