Her er en kort og scannbar oppsummering du kan lime rett inn i dokumentasjonen din:

---

# Neovim Treesitter-dokumentasjon (Uten Plugins)

Neovim 0.10+ har innebygd støtte for Treesitter-highlighting. Vi bruker **systemets egne parsere** og Neovims kjerne i stedet for eksterne plugins (som det arkiverte `nvim-treesitter`).

## 1. Konfigurasjon (`treesitter.lua`)

Dette skrus på globalt via en `Autocmd` som aktiverer highlighting når en støttet filtype åpnes:

```lua
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        -- Ignorer tomme buffere og spesialvinduer (f.eks. filutforskere)
        if args.match == "" or args.match == "neo-tree" then
            return
        end

        -- Sjekk om Neovim finner en parser for språket
        local lang = vim.treesitter.language.get_lang(args.match) or args.match
        local has_parser, _ = pcall(vim.treesitter.language.add, lang)
        
        -- Start highlighting hvis parseren eksisterer
        if has_parser then
            pcall(vim.treesitter.start, args.buf, lang)
        end
    end,
})

```

## 2. Arkitektur (Hva kreves på disken?)

For at fargene skal fungere for et gitt språk, kreves to uavhengige elementer i filsystemet:

1. **Parseren (`.so`-fil):** Skanner kodesyntaksen. Ligger i `~/.local/share/nvim/site/parser/`.
2. **Queries (`.scm`-fil):** Bestemmer hvilke farger syntaksen skal få. Ligger i `~/.local/share/nvim/site/queries/<språk>/highlights.scm`.

> ⚠️ **Merk:** Hvis du bytter fra en plugin-behandler (f.eks. Lazy), må gamle/døde symlinks i `site/queries/` renses ut med:
> `find ~/.local/share/nvim/site/queries/ -type l -delete`

## 3. Slik henter du nye språk manuelt

Hvis et språk mangler highlighting (f.eks. Go):

1. **Parser:** Installer via systemets pakkebehandler (f.eks. `npm install -g tree-sitter-cli`, `apt install tree-sitter-cli` eller `brew install tree-sitter`). Neovim plukker den opp automatisk.
2. **Queries:** Hent den offisielle `highlights.scm` fra [nvim-treesitter på GitHub](https://github.com/nvim-treesitter/nvim-treesitter) og plasser den her:
```bash
~/.local/share/nvim/site/queries/<språknavn>/highlights.scm

```

