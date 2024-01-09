-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
LuaSettings = {}
LuaSettings.diagnostics = {}
LuaSettings.runtime = {}
LuaSettings.runtime.nonstandardSymbol = {
    "`",
    "/**/",
    "+=",
    "-=",
    "*=",
    "/=",
    "<<=",
    ">>=",
    "&=",
    "|=",
    "^=",
    "?.",
}
LuaSettings.workspace = {}
LuaSettings.workspace.ignoreDir = {
    ".vscode",
    "[map]",
    "[custom]",
    ".git",
    ".github",
    "node_modules",
}

LuaSettings.workspace.library = {
    "/home/dustin/ndrp/[tmc]/core/modules/gta5/client.lua",
    "/home/dustin/ndrp/[tmc]/core/modules/gta5/server.lua",
    "/home/dustin/ndrp/[tmc]/core/client/main.lua",
    "/home/dustin/ndrp/[tmc]/core/server/main.lua",
    "/home/dustin/ndrp/[tmc]/core/common/functions.lua",
    "/home/dustin/ndrp/[tmc]/core/client/functions.lua",
    "/home/dustin/ndrp/[tmc]/core/server/functions.lua",
    "/home/dustin/.vscode-server/extensions/overextended.cfxlua-vscode-1.7.8/plugin/library/runtime",
    "/home/dustin/.vscode-server/extensions/overextended.cfxlua-vscode-1.7.8/plugin/library/natives/CFX-NATIVE",
    "/home/dustin/.vscode-server/extensions/overextended.cfxlua-vscode-1.7.8/plugin/library/natives/GTAV",
    "/home/dustin/ndrp/[tmc]/core/modules/gta5/client/functions.lua",
}
LuaSettings.diagnostics.disable = {
    "missing-parameter",
    "lowercase-global",
    "undefined-global",
}
-- Lua.completion.callSnippet = "Replace",
-- LuaSettings.diagnostics.libraryFiles = "Enable"

return {
    -- add pyright to lspconfig
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            servers = {
                -- pyright will be automatically installed with mason and loaded with lspconfig
                lua_ls = {
                    settings = {
                        Lua = LuaSettings,
                    },
                },
            },
            autoformat = false,
        },
    },

    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
    { import = "lazyvim.plugins.extras.lang.typescript" },
}
