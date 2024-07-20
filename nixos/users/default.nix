{ pkgs, ...}:
{
  users.users.alpa = {
    isNormalUser = true;
    description = "alpa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
}