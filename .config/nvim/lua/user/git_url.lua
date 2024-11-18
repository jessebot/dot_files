local function get_git_url()

    -- this gets the full origin like git@github.com:jessebot/onboardme.git
    local remote_origin = vim.fn.system("git remote get-url origin")

    -- split into git@github.com and jessebot/onboardme.git
    local base_domain, owner_repo = string.match(remote_origin, "(.*):(.*)")

    print(base_domain)

    -- this only works on github right now
    if string.find(base_domain, "github.com") then
        local gh_url = "https://github.com/"

        -- git repo root directory
        local git_root_dir = vim.fn.system("git rev-parse --show-prefix"):gsub("[\n\r]", " ")
        -- get the name of the current opened file
        local current_file = vim.fn.expand('%:t')
        -- get the current line number
        local current_line = unpack(vim.api.nvim_win_get_cursor(0))

        -- combine file path, naem of file, and line number
        local file_line = git_root_dir .. current_file .. "#L" .. current_line
        file_line = string.gsub(file_line, "%s+", "")

        -- get name of branch
        local branch = vim.fn.system("git branch --show")

        -- changes jessebot/onboardme.git to jessebot/onboardme/blob/main/
        local repo_branch_url = owner_repo:gsub(".git", "/blob/" .. branch)

        -- combines https://github.com/ + jessebot/onboardme/blob/main/ + path/file.txt#1
        gh_url = gh_url .. repo_branch_url .. "/" .. file_line

        -- remove all new lines and white space
        gh_url = string.gsub(gh_url, "%s+", "")
        gh_url = string.gsub(gh_url, "[\n\r]", "")

        print("External git link is:")
        print(gh_url)
    end
end

-- ------------------------------ open bpython -------------------------------
-- install bpython beforehand: brew install bpython
vim.api.nvim_create_user_command(
    'GitUrl',
    function()
        get_git_url()
    end,
    { bang = true }
)
