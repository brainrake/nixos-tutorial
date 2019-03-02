{
  security.sudo.enable = true;
  users.users.myuser = {
    isNormalUser = true;
    password = "changeme";
    extraGroups = [ "wheel" ];
  };
}
