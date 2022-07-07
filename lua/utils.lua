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

-- run f, but restore the registers specified in regs afterwards
function M.with_reg(regs, f)
    local stored = {}
    table.foreachi(regs, function(_i, reg)
        stored[reg] = vim.fn.getreginfo(reg)
    end)
    local ret = f()
    table.foreach(stored, function(reg, value)
        vim.fn.setreg(reg, value)
    end)
    return ret
end

--- execute command for every occurence of pattern
--- 
---@param pattern the vim regex pattern to search for
---@param command the normal mode vim command to execute
function M.map_pattern(pattern, command)
    -- TODO
end

function M.fstring_to_percent()
    M.with_reg({"r", "\""}, function()
        vim.cmd "normal! yy"
        vim.cmd "new"
        vim.cmd "normal! Vpf(lx"
        while vim.fn.search("{[^}]\\+}") ~= 0 do
            vim.cmd "normal! yi}ca}%s$i, \"0p"
        end
        vim.cmd "normal! yy"
        vim.cmd "bd!"
        vim.cmd "normal! Vp"
    end)
end

return M

