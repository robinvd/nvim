M = {}

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
        vim.cmd('normal! ')
    until vim.bo.buftype == ''
    vim.cmd('stopinsert')
end

return M
