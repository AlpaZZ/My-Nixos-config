{ pkgs, ... }:
{  
  hardware = {
    sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
    disabledDefaultBackends = [ "escl" ];
  };
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
    
      ];
    };
  };
}
