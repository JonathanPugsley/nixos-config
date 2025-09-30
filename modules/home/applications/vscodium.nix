{ config, lib, pkgs, inputs, ... }: {
  options.modules.vscodium.enable = lib.mkEnableOption "enable vscodium";

  config.programs.vscode = lib.mkIf config.modules.vscodium.enable {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;

    profiles.default = {
      userSettings = {
        "editor.minimap.enabled" = false;
        "editor.scrollbar.horizontal" = "hidden";
        "editor.scrollbar.vertical" = "hidden";
        "editor.smoothScrolling" = true;
        "editor.tabSize" = 2;
        "files.autoSaveWhenNoErrors" = true;
        "files.insertFinalNewline" = true;
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "gitlens.showWelcomeOnInstall" = false;
        "gitlens.showWhatsNewAfterUpgrade" = false;
        "terminal.integrated.scrollback" = 1000;
        "update.showReleaseNotes" = false;
        "workbench.colorTheme" = "Gruvbox Dark Medium";
        "workbench.iconTheme" = "catppuccin-frappe";
        "workbench.sideBar.location" = "right";
        "workbench.startupEditor" = "none";
        "workbench.tree.renderIndentGuides" = "always";
        "window.menuBarVisibility" = "toggle";
      };

      extensions = with inputs.nix-vscode-extenstions.extensions.x86_64-linux.vscode-marketplace; [
        bbenoist.nix
        catppuccin.catppuccin-vsc-icons
        eamodio.gitlens
        editorconfig.editorconfig
        ms-python.python
        streetsidesoftware.code-spell-checker
        tamasfe.even-better-toml
        usernamehw.errorlens
      ];
    };
  };
}
