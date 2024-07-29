{
  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    #proxy
    proxy.default = "http://192.168.49.1:8282";
    proxy.rsyncProxy = "http://192.168.49.1:8282";
    proxy.httpsProxy = "http://192.168.49.1:8282";
    proxy.httpProxy = "http://192.168.49.1:8282";
    proxy.ftpProxy = "http://192.168.49.1:8282";
    proxy.allProxy = "http://192.168.49.1:8282";
    proxy.noProxy = "localhost,127.0.0.1,localaddress,.localdomain.com";
  };
}