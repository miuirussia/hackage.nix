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
    flags = {};
    package = {
      specVersion = "1.2";
      identifier = { name = "fdo-notify"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "max.rabkin@gmail.com";
      author = "Max Rabkin";
      homepage = "http://bitbucket.org/taejo/fdo-notify/";
      url = "";
      synopsis = "Desktop Notifications client";
      description = "A library for issuing notifications using FreeDesktop.org's Desktop\nNotifications protcol. This protocol is supported by services such\nas Ubuntu's NotifyOSD.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."dbus-client" or (errorHandler.buildDepError "dbus-client"))
          (hsPkgs."dbus-core" or (errorHandler.buildDepError "dbus-core"))
          ];
        buildable = true;
        };
      };
    }