{
  security.sudo.enable = true;
  users.users.user = {
    isNormalUser = true;
    password = "changeme";
    extraGroups = [ "wheel" ];
  };
}
