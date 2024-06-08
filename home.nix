# Home Manager Konfiguration für den Benutzer "rey"

{ pkgs, ... }:

{
  # Konfiguriere die Shell
  programs.zsh.enable = true;
  programs.zsh.promptInit = false;
  home.file.".zshrc".text = ''
    export EDITOR="nvim"
  '';

  # Konfiguriere Neovim
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number
      set tabstop=4
      set softtabstop=4
      set shiftwidth=4
      set expandtab
    '';
  };

  # Konfiguriere den Bildschirm
  services.xserver.libinput.enable = true;
}

