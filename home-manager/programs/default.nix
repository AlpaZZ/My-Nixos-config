{
  imports = [
    ./git.nix
  ];
  programs = {
    alacritty = import ./alacritty.nix;
    zsh = import ./zsh.nix;
   # direnv = import ./direnv.nix;
  };
}