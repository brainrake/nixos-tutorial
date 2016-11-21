{
  security.sudo.enable = true;
  users.users.staruser = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [ "" ];
  };
}
