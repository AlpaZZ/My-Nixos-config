{
  pkgs,
  ...
}:

{
  users.users.alpa = {
    isNormalUser = true;
    description = "alpa";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
      ];
      shell = pkgs.bash;
      ignoreShellProgramCheck = true;
      packages = with pkgs; [
      ];
    };
    # "newuser" = {
    #   homeMode = "755";
    #   isNormalUser = true;
    #   description = "New user account";
    #   extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    #   shell = pkgs.bash;
    #   ignoreShellProgramCheck = true;
    #   packages = with pkgs; [];
    # };
}
