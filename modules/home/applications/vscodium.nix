{ config, pkgs, inputs, ... }: {
  config.programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;

    profiles.default = {
      userSettings = {
        "editor.smoothScrolling" = true;
        "files.autoSaveWhenNoErrors" = true;
        "files.insertFinalNewline" = true;
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "gitlens.showWelcomeOnInstall" = false;
        "gitlens.showWhatsNewAfterUpgrade" = false;
        "terminal.integrated.scrollback" = 1000;
        "update.showReleaseNotes" = false;
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
