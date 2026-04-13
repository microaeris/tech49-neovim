# tech49.nvim

Neovim port of the VS Code Tech49 high-contrast theme from
<https://github.com/timdang/tech49_theme>.

## Usage

With any plugin manager, load this directory and then use:

```lua
vim.cmd.colorscheme("tech49")
```

If you want the explicit high-contrast name instead:

```lua
vim.cmd.colorscheme("tech49_high_contrast")
```

## LazyVim

Add the theme as a plugin and set the colorscheme in your LazyVim config.

If this theme is in a GitHub repo:

```lua
return {
  {
    "microaeris/tech49.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tech49")
    end,
  },
}
```

Put either example in a file such as `~/.config/nvim/lua/plugins/colorscheme.lua`.
Use `tech49_high_contrast` instead of `tech49` if you want the explicit high-contrast colorscheme name.

## Notes

- Matches the source theme's black background, cyan/orange accents, and muted olive strings.
- Includes core editor groups, common syntax groups, Treesitter captures, LSP semantic tokens, diagnostics, diff, and terminal colors.
