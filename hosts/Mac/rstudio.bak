{ pkgs, ... }:

let
  R-with-my-packages = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [
      haven
      ggplot2
      dplyr
      # Add other R packages here
    ];
  };
in
{
  environment.systemPackages = with pkgs; [
    R-with-my-packages
    # Other system packages
  ];
}

