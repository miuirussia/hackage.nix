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
      specVersion = "1.0";
      identifier = { name = "DBus"; version = "0.4"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2006 Evan Martin <martine@danga.com>\n2008 David Himmelstrup <lemmih@gmail.com>";
      maintainer = "David Himmelstrup";
      author = "Evan Martin <martine@danga.com>, David Himmelstrup <lemmih@gmail.com>";
      homepage = "http://seize.it/mirror/hdbus";
      url = "";
      synopsis = "DBus bindings";
      description = "Bindings for the D-Bus API.\nFor details on D-Bus, see the D-Bus wiki at:\n<http://www.freedesktop.org/wiki/Software/dbus>";
      buildType = "Configure";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
        buildable = true;
        };
      };
    }