{
  imports = [];
  programs = {
    git = import ./git.nix;
    alacritty = import ./alacritty.nix;
    zsh = import ./zsh.nix;
    #nixvim = import ./nixvim.nix;
  };
}