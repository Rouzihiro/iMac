{ pkgs ? import <nixpkgs> {}, ... }:

let
  # Define the custom RStudio environment with desired packages
  RStudio-with-my-packages = pkgs.rstudioWrapper.override {
    packages = with pkgs.rPackages; [
      tidyverse
      snakecase
    ];
  };
in
{
  environment.systemPackages = with pkgs; [
    neovim           # Text editor
    RStudio-with-my-packages # RStudio with specific R packages
    # Add other programs here as needed
    # other-programs-y
  ];

  # Optionally, add environment variables if needed
  environment.variables = {
    # Add any environment variables here if needed
  };
}

