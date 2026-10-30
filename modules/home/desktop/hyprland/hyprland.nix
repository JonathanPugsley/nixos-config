{ osConfig, config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.modules.hyprland.enable {
    stylix.targets.hyprland.enable = false;
    wayland.windowManager.hyprland = {
      enable = true;

      configType = "lua";
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

      xwayland.enable = true;
      systemd.enable = true;
      # settings.opengl.nvidia_anti_flicker = true;

      extraLuaFiles = {
        "animations.lua" = { content = ./animations.lua; autoLoad = true; };
        "binds.lua" = { content = ./binds.lua; autoLoad = true; };
        "env.lua" = { content = ./env.lua; autoLoad = true; };
        "general.lua" = { content = ./general.lua; autoLoad = true; };
        "monitors.lua" = { content = ./monitors.lua; autoLoad = true; };
        "rules.lua" = { content = ./rules.lua; autoLoad = true; };

        "colors.lua" = ''
          base00 = 0xff${config.lib.stylix.colors.base00}
          base01 = 0xff${config.lib.stylix.colors.base01}
          base02 = 0xff${config.lib.stylix.colors.base02}
          base03 = 0xff${config.lib.stylix.colors.base03}
          base04 = 0xff${config.lib.stylix.colors.base04}
          base05 = 0xff${config.lib.stylix.colors.base05}
          base06 = 0xff${config.lib.stylix.colors.base06}
          base07 = 0xff${config.lib.stylix.colors.base07}
          base08 = 0xff${config.lib.stylix.colors.base08}
          base09 = 0xff${config.lib.stylix.colors.base09}
          base0A = 0xff${config.lib.stylix.colors.base0A}
          base0B = 0xff${config.lib.stylix.colors.base0B}
          base0C = 0xff${config.lib.stylix.colors.base0C}
          base0D = 0xff${config.lib.stylix.colors.base0D}
          base0E = 0xff${config.lib.stylix.colors.base0E}
          base0F = 0xff${config.lib.stylix.colors.base0F}
        '';
        "commands.lua" = let
          alacritty = "${pkgs.alacritty}/bin/alacritty";
          librewolf = "${pkgs.librewolf}/bin/librewolf";
          rofi = "${pkgs.rofi}/bin/rofi";
          yazi = "${pkgs.yazi}/bin/yazi";
        in ''
          browser = '${librewolf}'
          terminal = '${alacritty}'
          launcher = '${rofi} -show drun'
          fileManager = '${alacritty} -e ${yazi} $HOME'
        '';
        "xkb.lua" = ''xkb_layout = ${osConfig.services.xserver.xkb.layout}'';
      };
    };
  };
}
