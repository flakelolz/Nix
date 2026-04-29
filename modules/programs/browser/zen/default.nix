{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    profiles = {
      default = {
        settings = {
          "zen.workspaces.separate-essentials" = false;
          "zen.workspaces.continue-where-left-off" = false;
          "zen.welcome-screen.seen" = true;
          "zen.urlbar.behavior" = "float";
          "browser.tabs.fadeOutUnloadedTabs" = true;
          "zen.pinned-tab-manager.restore-pinned-tabs-to-pinned-url" = true;
        };
        extensions = {
          packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
            adnauseam
            bitwarden
            vimium-c
            raindropio
            control-panel-for-twitter
            darkreader
            return-youtube-dislikes
            youtube-no-translation
            search-by-image
            # Better Volume Booster # Doesn't exist on the NUR
            # Thumbnail Rating Bar for Youtube # Doesn't exist on the NUR
            # frankerfacez # Unfree. Can't install
            # keepa # Unfree. Can't install
            # imagus # Unfree. Can't install
          ];
        };
        mods = [
          "2317fd93-c3ed-4f37-b55a-304c1816819e" # Audio Indicator Enhanced
        ];
        containersForce = true;
        containers = {
          Personal = {
            color = "blue";
            icon = "fingerprint";
            id = 1;
          };
          Work = {
            color = "orange";
            icon = "briefcase";
            id = 2;
          };
          Banking = {
            color = "green";
            icon = "dollar";
            id = 3;
          };
          Shopping = {
            color = "pink";
            icon = "cart";
            id = 4;
          };
        };
        pins =
          let
            containers = config.programs.zen-browser.profiles."default".containers;
          in
          {
            "Youtube" = {
              id = "4a6b7a9d-6976-4f4d-99dc-4d46c995e5ce";
              url = "https://www.youtube.com/";
              isEssential = true;
              position = 101;
            };
            "Twitter" = {
              id = "8f65be06-45a9-4e4b-a90e-04828a1c0d82";
              url = "https://www.twitter.com/";
              isEssential = true;
              position = 102;
            };
            "Reddit" = {
              id = "c2e2474d-0f3c-4da9-bf02-4079d8fe95b8";
              url = "https://www.reddit.com/";
              isEssential = true;
              position = 103;
            };
            "Twitch" = {
              id = "bc6da5ed-2bf8-48a9-a27d-c12515ed86a0";
              url = "https://www.twitch.com/";
              isEssential = true;
              position = 104;
            };
            "BlueSky" = {
              id = "3717dbbe-5199-4e8b-9bb3-f71c35078cf2";
              url = "https://bsky.app/";
              isEssential = true;
              position = 105;
            };
            "YT Music" = {
              id = "d76fbe62-e73a-4527-8883-831ae305ba0f";
              url = "https://music.youtube.com/";
              isEssential = true;
              position = 106;
              container = containers.Personal.id;
            };
          };
      };
    };
    # Add any other native connectors here
    # nativeMessagingHosts = [ pkgs.firefoxpwa ];
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
