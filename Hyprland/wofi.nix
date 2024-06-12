{ config, pkgs, lib, ... }:

let
  wofiConfig = ''
    [config]
    prompt = Run:
    max-lines = 10
    max-columns = 1
    anchor = center
    width = 40%
    height = 40%
    font = "monospace 12"
    background-color = #282c34
    foreground-color = #abb2bf
    selection-color = #61afef
    margin = 10
    spacing = 5
  '';

  wofiStyle = ''
    * {
      font-family: "Symbols Nerd Font", "Cascadia Code";
      font-size: 13px;
      box-shadow: none;
    }

    window {
      background-color: rgba(13, 27, 42, 0.950);
      border: 2px solid rgba(224, 86, 116, 0.8);
      border-radius: 10px;
      color: #f4cac3;
    }

    #input, #entry, #expander-box {
      background-color: transparent;
    }

    #input {
      border: none;
      border-bottom: 2px solid rgba(224, 86, 116, 0.8);
      border-radius: 0px;
      color: #e27b8b;
    }

    #input image {
      border: none;
      color: #e27b8b;
    }

    #scroll {
      margin: 3px 0px;
    }

    #entry {
      padding: 2px 5px;
      outline: none;
    }

    #entry:selected #text {
      color: #e27b8b;
    }
  '';
in
{
  # Kopiere die wofi-Konfigurationsdateien an den richtigen Ort
  environment.etc."xdg/wofi/config".text = wofiConfig;
  environment.etc."xdg/wofi/style.css".text = wofiStyle;

  # Füge wofi zu den Systempaketen hinzu
  environment.systemPackages = with pkgs; [
    wofi
    nerdfonts
    cascadia-code
  ];
}

