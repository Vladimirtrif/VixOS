{
  lib,
  osConfig,
  pkgs,
  ...
}:
lib.mkIf osConfig.dev.enable {
  stylix.targets.neovim.enable = false;
  catppuccin.nvim.enable = true;
  programs.neovim = {
    enable = true;
    withPython3 = false;
    withRuby = false;
    extraPackages = with pkgs; [
      nixd
      ocamlPackages.ocaml-lsp
      ocamlPackages.ocamlformat
    ];
    plugins = with pkgs.vimPlugins; [
      fzf-lua
      grug-far-nvim
      nvim-lspconfig
    ];
    initLua = ''
      local lspconfig = require('lspconfig')
      vim.lsp.inlay_hint.enable(true)
      vim.lsp.config('ocamllsp', {
        settings = {
          codelens = { enable = true },
          inlayHints = { hintPatternVariables = true, hintLetBindings = true },
        }
      })
      vim.lsp.enable{'nixd', 'ocamllsp'}
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.wrap = false
      vim.opt.cursorline = true
      vim.opt.scrolloff = 10
      vim.opt.sidescrolloff = 8

      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.smartindent = true
      vim.opt.autoindent = true

      vim.opt.ignorecase = true
      vim.opt.smartcase = true
      vim.opt.incsearch = true

      vim.opt.showmatch = true
      vim.opt.colorcolumn = "90"
      vim.opt.signcolumn = "yes"
      vim.opt.autoread = true
      vim.opt.iskeyword:append({"-"})
      vim.opt.path:append("**")
      vim.opt.clipboard:append("unnamedplus")

      vim.opt.encoding = "UTF-8"

      vim.opt.termguicolors = true

    '';
  };
}
