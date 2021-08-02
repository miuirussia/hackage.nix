{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = {
      with_xft = false;
      with_utf8 = true;
      with_inotify = false;
      with_iwlib = false;
      with_mpd = false;
      all_extensions = false;
      with_alsa = false;
      with_datezone = false;
      with_mpris = false;
      with_dbus = false;
      with_xpm = false;
      with_threaded = false;
      with_rtsopts = true;
      with_uvmeter = false;
      with_weather = true;
      with_conduit = false;
      };
    package = {
      specVersion = "1.8";
      identifier = { name = "xmobar"; version = "0.29.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Jose A. Ortega Ruiz <jao@gnu.org>";
      author = "Andrea Rossato and Jose A. Ortega Ruiz";
      homepage = "http://xmobar.org";
      url = "";
      synopsis = "A Minimalistic Text Based Status Bar";
      description = "Xmobar is a minimalistic text based status bar.\n\nInspired by the Ion3 status bar, it supports similar\nfeatures, like dynamic color management, output templates,\nand extensibility through plugins.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ((((((((((([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."regex-compat" or (errorHandler.buildDepError "regex-compat"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."X11" or (errorHandler.buildDepError "X11"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."parsec-numbers" or (errorHandler.buildDepError "parsec-numbers"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."extensible-exceptions" or (errorHandler.buildDepError "extensible-exceptions"))
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.0.2") (hsPkgs."unsupported-ghc-version" or (errorHandler.buildDepError "unsupported-ghc-version"))) ++ (pkgs.lib).optionals (flags.with_xft || flags.all_extensions) [
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          (hsPkgs."X11-xft" or (errorHandler.buildDepError "X11-xft"))
          ]) ++ (pkgs.lib).optional (flags.with_utf8 || flags.all_extensions) (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))) ++ (pkgs.lib).optional (flags.with_inotify || flags.all_extensions) (hsPkgs."hinotify" or (errorHandler.buildDepError "hinotify"))) ++ (pkgs.lib).optional (flags.with_iwlib || flags.all_extensions) (hsPkgs."iwlib" or (errorHandler.buildDepError "iwlib"))) ++ (pkgs.lib).optional (flags.with_mpd || flags.all_extensions) (hsPkgs."libmpd" or (errorHandler.buildDepError "libmpd"))) ++ (pkgs.lib).optionals (flags.with_alsa || flags.all_extensions) [
          (hsPkgs."alsa-mixer" or (errorHandler.buildDepError "alsa-mixer"))
          (hsPkgs."alsa-core" or (errorHandler.buildDepError "alsa-core"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          ]) ++ (pkgs.lib).optionals (flags.with_datezone || flags.all_extensions) [
          (hsPkgs."timezone-olson" or (errorHandler.buildDepError "timezone-olson"))
          (hsPkgs."timezone-series" or (errorHandler.buildDepError "timezone-series"))
          ]) ++ (pkgs.lib).optional (flags.with_mpris || flags.all_extensions) (hsPkgs."dbus" or (errorHandler.buildDepError "dbus"))) ++ (pkgs.lib).optional (flags.with_dbus || flags.all_extensions) (hsPkgs."dbus" or (errorHandler.buildDepError "dbus"))) ++ (pkgs.lib).optionals (flags.with_weather || flags.all_extensions) ([
          (hsPkgs."HTTP" or (errorHandler.buildDepError "HTTP"))
          ] ++ (pkgs.lib).optionals (flags.with_conduit) [
          (hsPkgs."http-conduit" or (errorHandler.buildDepError "http-conduit"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          ])) ++ (pkgs.lib).optionals (flags.with_uvmeter && flags.with_conduit) [
          (hsPkgs."http-conduit" or (errorHandler.buildDepError "http-conduit"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          ];
        libs = ([
          (pkgs."Xrandr" or (errorHandler.sysDepError "Xrandr"))
          (pkgs."Xrender" or (errorHandler.sysDepError "Xrender"))
          ] ++ (pkgs.lib).optional (flags.with_iwlib || flags.all_extensions) (pkgs."iw" or (errorHandler.sysDepError "iw"))) ++ (pkgs.lib).optional (flags.with_xpm || flags.all_extensions) (pkgs."Xpm" or (errorHandler.sysDepError "Xpm"));
        buildable = true;
        };
      exes = {
        "xmobar" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."X11" or (errorHandler.buildDepError "X11"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."xmobar" or (errorHandler.buildDepError "xmobar"))
            ];
          buildable = true;
          };
        };
      tests = {
        "XmobarTest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."regex-compat" or (errorHandler.buildDepError "regex-compat"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."X11" or (errorHandler.buildDepError "X11"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."parsec-numbers" or (errorHandler.buildDepError "parsec-numbers"))
            (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
            (hsPkgs."async" or (errorHandler.buildDepError "async"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."xmobar" or (errorHandler.buildDepError "xmobar"))
            ] ++ (pkgs.lib).optionals (flags.with_alsa || flags.all_extensions) [
            (hsPkgs."alsa-mixer" or (errorHandler.buildDepError "alsa-mixer"))
            (hsPkgs."alsa-core" or (errorHandler.buildDepError "alsa-core"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            ];
          buildable = true;
          };
        };
      };
    }