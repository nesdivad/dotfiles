-- Install Roslyn:
-- 'dotnet tool install -g roslyn-language-server --prerelease --source https://pkgs.dev.azure.com/azure-public/vside/_packaging/vs-impl/nuget/v3/index.json'

vim.pack.add({
    {
        src = "https://github.com/seblyng/roslyn.nvim",
        version = "main",
    }
})

require("roslyn").setup({
    filewatching = "auto",
})
