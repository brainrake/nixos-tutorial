{
  services.monit = {
    enable = true;
    config = ''
      set daemon 1
      set httpd port 2812
          allow admin:monit
    '';
  };
}
