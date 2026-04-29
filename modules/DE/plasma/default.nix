{ pkgs, ... }:

{
  # Plasma user configuration
  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor = {
        theme = "Breeze_Dark";
      };
      iconTheme = "breeze";
      wallpaper = "/home/flakelolz/NixOS/modules/DE/wallpapers/astronaut-jellyfish-hd.jpg";
    };

    kscreenlocker = {
      autoLock = false;
    };

    kwin = {
      cornerBarrier = false;
      edgeBarrier = 0;

      effects = {
        shakeCursor.enable = false;
      };
    };

    session = {
      sessionRestore = {
        restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };
    };

    panels = [
      {
        location = "bottom";
        height = 44;

        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

    input = {
      mice = [
        {
          name = "2.4G Wireless mouse";
          vendorId = "1267";
          productId = "623";
          accelerationProfile = "none";
        }
      ];
    };

    shortcuts = {
      "kwin"."Window Close" = "Meta+Q";
      "kwin"."Overview" = "Meta+Tab";
      "kwin"."Present Windows" = "Ctrl+Alt+Tab";
    };

  };
}
