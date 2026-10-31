{ lib, ... }: {
  options.modules.desktop = {
    monitors = lib.mkOption {
      description = "host specific monitor configuration";

      type = lib.types.listOf (lib.types.submodule {
        options = {
          output = lib.mkOption {
            type = lib.types.str;
            description = "monitor output name";
          };

          mode = lib.mkOption {
            type = lib.types.str;
            description = "resolution and refresh rate";
            default = "preferred";
          };

          position = lib.mkOption {
            type = lib.types.str;
            default = "auto";
          };

          scale = lib.mkOption {
            type = lib.types.str;
            default = "1";
          };

          workspaces = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
          };
        };
      });

      default = [];
    };
  };
}
