local M = {}

function M.tbl_contains(tbl, value)
    for _, item in ipairs(tbl) do
        if item == value then
            return true
        end
    end
    return false
end

function M.next_normal_window()
    repeat
        vim.cmd "normal! "
    until vim.bo.buftype == ""
    vim.cmd "stopinsert"
end

function M.escape_dir(dir)
  return dir:gsub("/", ":")
end

function M.escaped_session_name_from_cwd()
  return M.escape_dir(vim.fn.getcwd())
end

return M
