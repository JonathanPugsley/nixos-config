{ config, pkgs, inputs, ... }: {
  config.programs.librewolf = {
    enable = true;

    profiles.default = {
      
      id = 0;
      name = "default";
      isDefault = true;
      
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        consent-o-matic
        darkreader
        decentraleyes
        proton-pass
        ublock-origin
      ];
      
      search = {
        force = true;
        default = "ddg";
        order = [ "ddg" ];
        engines = {
          "ddg" = {
            urls = [{ template = "https://duckduckgo.com/?q={searchTerms}"; }];
            icon = "https://duckduckgo.com/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # daily
            definedAliases = [ "@duckduckgo" "@ddg" ];
          };
          "google".metaData.hidden = true;
          "bing".metaData.hidden = true;
          "policy-DuckDuckGo Lite".metaData.hidden = true;
          "policy-MetaGer".metaData.hidden = true;
          "policy-Mojeek".metaData.hidden = true;
          "policy-SearXNG - searx.be".metaData.hidden = true;
          "policy-StartPage".metaData.hidden = true;
        };
      }; # end of search settings

      settings = {
        # remove border from window
        "browser.tabs.inTitlebar" = 0;

        # enable drm
        "drm" = true;
        "media.eme.enabled" = true;

        # performance
        "widget.dmabuf.force-enabled" = true; # required in recent firefoxes

        # blank new tabs and windows
        "browser.startup.blankWindow" = true;

        # disable firefox home content
        "browser.newtabpage.activity-stream.showSearch" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;

        # remove suggestions
        "browser.urlbar.suggest.enabled.private" = false;
        "browser.urlbar.suggest.enabled" = false;
        "browser.urlbar.suggest.bookmark" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.pocket" = false;
        "browser.urlbar.suggest.mdn" = false;
        "browser.urlbar.suggest.recentsearches" = false;
        "browser.urlbar.suggest.remotetab" = false;
        "browser.urlbar.suggest.weather" = false;
        "browser.urlbar.suggest.trending" = false;
        "browser.urlbar.suggest.yelp" = false;

        # privacy
        "app.update.auto" = false;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.ctrlTab.recentlyUsedOrder" = false;
        "browser.laterrun.enabled" = false;
        "browser.protections_panel.infoMessage.seen" = true;
        "browser.quitShortcut.disabled" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "datareporting.policy.dataSubmissionEnable" = false;
        "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
        "dom.security.https_only_mode_ever_enabled" = true;
        "extensions.pocket.enabled" = false;
        "identity.fxaccounts.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "extensions.formautofill.creditCards.enabled" = false;
        "signon.rememberSignons" = false;
        "signon.generation.enabled" = false;
        "signon.firefoxRelay.feature" = "disabled";
        "signon.management.page.breach-alerts.enabled" = false;

        # cosmetics
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.urlbar.placeholderName" = "DuckDuckGo";
        "browser.urlbar.placeholderName.private" = "DuckDuckGo";


        # based on: "https://github.com/arkenfox/user.js/blob/master/user.js"
        # disable 'about:config' warning
        "browser.aboutConfig.showWarning" = false;
        # startup
        "browser.startup.page" = 0;
        "browser.startup.homepage" = "about:blank";
        "browser.newtabpage.enabled" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";
        # geolocation
        "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
        "geo.provider.use_gpsd" = false;
        "geo.provider.use_geoclue" = false;
        # quieter Fox
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.discovery.enabled" = false;
        "browser.shopping.experience2023.enabled" = false;
        # telemetry
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.ping-centre.telemetry" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        # studies
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = false;
        # crash reports
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
        # other
        "captivedetect.canonicalURL" = "";
        "network.captive-portal-service.enabled" = false;
        "network.connectivity-service.enabled" = false;
        # safe browsing
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "network.prefetch-next" = false;
        "network.dns.disablePrefetch" = false;
        "network.predictor.enabled" = false;
        "network.predictor.enable-prefetch" = false;
        "network.http.speculative-parallel-limit" = 0;
        "browser.places.speculativeConnect.enabled" = false;
        # DNS / DoH / proxy / socks
        "network.proxy.socks_remote_dns" = true;
        "network.file.disable_unc_paths" = true;
        "network.gio.supported-protocols" = "";
        # location bar / search bar / suggestions / history / forms
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.trending.featureGate" = false;
        "browser.urlbar.addons.featureGate" = false;
        "browser.urlbar.mdn.featureGate" = false;
        "browser.urlbar.pocket.featureGate" = false;
        "browser.urlbar.weather.featureGate" = false;
        "browser.formfill.enable" = false;
        "browser.search.separatePrivateDefault" = true;
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        # passwords
        "signon.autofillForms" = false;
        "signon.formlessCapture.enabled" = false;
        "network.auth.subresource-http-auth-allow" = 1;
        # disk avoidance
        "browser.cache.disk.enable" = false;
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "media.memory_cache_max_size" = 65536;
        "browser.sessionstore.privacy_level" = 2;
        "toolkit.winRegisterApplicationRestart" = false;
        "browser.shell.shortcutFavicons" = false;
        # HTTPS (SSL/TLS / OCSP / CERTS / HPKP)
        "security.ssl.require_safe_negotiation" = true;
        "security.tls.enable_0rtt_data" = false;
        "security.OCSP.enabled" = 1;
        "security.OCSP.require" = true;
        "security.cert_pinning.enforcement_level" = 2;
        "security.remote_settings.crlite_filters.enabled" = true;
        "security.pki.crlite_mode" = 2;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_send_http_background_request" = false;
        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;
        # referers
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
        # plugins / media / webRTC
        "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
        "media.peerconnection.ice.default_address_only" = true;
        # dom
        "dom.disable_window_move_resize" = true;
        # miscellaneous
        "browser.download.start_downloads_in_tmp_dir" = true;
        "browser.helperApps.deleteTempFileOnExit" = true;
        "browser.uitour.enabled" = false;
        "devtools.debugger.remote-enabled" = false;
        "permissions.manager.defaultsUrl" = "";
        "webchannel.allowObject.urlWhitelist" = "";
        "network.IDN_show_punycode" = true;
        "pdfjs.disabled" = false;
        "pdfjs.enableScripting" = false;
        "browser.tabs.searchclipboardfor.middleclick" = false;
        # downloads
        "browser.download.useDownloadDir" = false;
        "browser.download.alwaysOpenPanel" = false;
        "browser.download.manager.addToRecentDocs" = false;
        "browser.download.always_ask_before_handling_new_types" = true;
        # extensions
        "extensions.enabledScopes" = 5;
        "extensions.postDownloadThirdPartyPrompt" = false;
        "browser.contentblocking.category" = "strict";
        # shutdown + sanitizing
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "privacy.clearOnShutdown.cache" = true;
        "privacy.clearOnShutdown.downloads" = true;
        "privacy.clearOnShutdown.formdata" = true;
        "privacy.clearOnShutdown.history" = true;
        "privacy.clearOnShutdown.sessions" = true;
        "privacy.clearOnShutdown.cookies" = true;
        "privacy.clearOnShutdown.offlineApps" = true;
        "privacy.cpd.cache" = true;
        "privacy.cpd.formdata" = true;
        "privacy.cpd.history" = true;
        "privacy.cpd.sessions" = true;
        "privacy.cpd.offlineApps" = false;
        "privacy.cpd.cookies" = false;
        "privacy.sanitize.timeSpan" = 0;
        # fingerprinting protection
        "privacy.resistFingerprinting" = true;
        "privacy.window.maxInnerWidth" = 1600;
        "privacy.window.maxInnerHeight" = 900;
        "privacy.resistFingerprinting.block_mozAddonManager" = true;
        "privacy.resistFingerprinting.letterboxing" = true;
        "browser.display.use_system_colors" = false;
        "widget.non-native-theme.enabled" = true;
        "browser.link.open_newwindow" = 3;
        "browser.link.open_newwindow.restriction" = 0;
        "webgl.disabled" = true;
        # do not touch
        "extensions.blocklist.enabled" = true;
        "network.http.referer.spoofSource" = false;
        "security.dialog_enable_delay" = 1000;
        "privacy.firstparty.isolate" = false;
        "extensions.webcompat.enable_shims" = true;
        "security.tls.version.enable-deprecated" = false;
        "extensions.webcompat-reporter.enabled" = false;
        "extensions.quarantinedDomains.enabled" = true;
        # non-project related
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.messaging-system.whatsNewPanel.enabled" = false;
        "browser.urlbar.showSearchTerms.enabled" = true;
      };
    };
  };
}
