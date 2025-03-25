{ pkgs, ... }:
{
  services = {
    gvfs.enable = true;
    gnome = {
      tinysparql.enable = true;
      gnome-keyring.enable = true;
    };
    dbus.enable = true;
    fstrim.enable = true;

    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = with pkgs; [
      gcr
      gnome-settings-daemon
    ];

    # database
    mysql = {
      enable = true;
      package = pkgs.mariadb;

      initialScript = pkgs.writeText "mysql-init.sql" ''
        ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';
        CREATE USER 'mirrr'@'localhost' IDENTIFIED BY '4321';
        GRANT ALL PRIVILEGES ON *.* TO 'mirrr'@'localhost' WITH GRANT OPTION;
        FLUSH PRIVILEGES;
      '';
    };

  };
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
