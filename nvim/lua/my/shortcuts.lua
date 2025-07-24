local linux_keys = {
    ["<d-n>"] = "<c-n>",
    ["<d-v>"] = "<c-v>",
    ["<d-c>"] = "<c-c>",
    ["<d-d>"] = "<c-s-d>",
    ["<d-a>"] = "<c-a>",
    ["<d-s>"] = "<c-s>",
    ["<d-left>"] = "<a-left>",
    ["<d-right>"] = "<a-right>",
    ["<d-s-right>"] = "<a-s-right>",
    ["<d-s-left>"] = "<a-s-left>",
    ["<d-t>"] = "<c-t>",
    ["<d-p>"] = "<c-p>",
    ["<d-s-p>"] = "<c-s-p>",
    ["<d-c-f>"] = "<f11>",
    ["<d-f>"] = "<c-f>",
    ["<d-s-f>"] = "<a-s-f>",
}

local windows_keys = {
    ["<d-n>"] = "<c-n>",
    ["<d-v>"] = "<c-v>",
    ["<d-c>"] = "<c-c>",
    ["<d-d>"] = "<c-s-d>",
    ["<d-a>"] = "<c-a>",
    ["<d-s>"] = "<c-s>",
    ["<d-left>"] = "<c-left>",
    ["<d-right>"] = "<c-right>",
    ["<d-s-right>"] = "<c-s-right>",
    ["<d-s-left>"] = "<c-s-left>",
    ["<d-t>"] = "<c-t>",
    ["<d-p>"] = "<c-p>",
    ["<d-s-p>"] = "<c-s-p>",
    ["<d-c-f>"] = "<f11>",
    ["<d-f>"] = "<c-f>",
    ["<d-s-f>"] = "<c-s-f>",
}

local function os_specific_shortcut(shortcut)
    if jit.os == "Windows" and windows_keys[shortcut] then
        return windows_keys[shortcut]
    elseif jit.os == "Linux" and linux_keys[shortcut] then
        return linux_keys[shortcut]
    end

    return shortcut
end

return os_specific_shortcut
