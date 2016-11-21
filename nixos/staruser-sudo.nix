{
  security.sudo.enable = true;
  users.users.staruser = {
    isNormalUser = true;
    password = "changeme";
    extraGroups = [ "wheel" ];
  };
}
