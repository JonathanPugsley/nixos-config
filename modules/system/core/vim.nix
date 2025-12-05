{ pkgs, ... }: {
  config = {
    environment.systemPackages = [ pkgs.vim ];
  };
}
