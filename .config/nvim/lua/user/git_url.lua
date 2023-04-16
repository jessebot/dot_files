local function get_git_url()

    -- this gets the full origin like git@github.com:jessebot/onboardme.git
    local remote_origin = vim.fn.system("git remote get-url origin")

    -- split into git@github.com and jessebot/onboardme.git
    local base_domain, owner_repo = string.match(remote_origin, "(.*):(.*)")

    -- this only works on github right now
    if string.find(base_domain, "github") then
        -- get the name of the current opened file
        local current_file = vim.fn.expand('%:p')

        -- git repo root directory
        local git_root_dir = vim.fn.system("git rev-parse --show-toplevel")
        remote_file_path = current_file:gsub(git_root_dir, "")
        print(remote_file_path)

        -- get the current line number
        local current_line = unpack(vim.api.nvim_win_get_cursor(0))
        file_line = remote_file_path .. "#L" .. current_line

        local branch = vim.fn.system("git branch --show")

        -- changes jessebot/onboardme.git to jessebot/onboardme/blob/main/
        repo_branch_url = owner_repo:gsub(".git", "/blob/" .. branch)

        local gh_url = "https://github.com/" .. repo_branch_url .. "/" .. file_line
        print(gh_url)
    end
end

get_git_url()
