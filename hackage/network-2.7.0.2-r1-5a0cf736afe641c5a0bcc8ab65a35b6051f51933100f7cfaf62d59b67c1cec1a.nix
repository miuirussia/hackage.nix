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
      specVersion = "1.8";
      identifier = { name = "network"; version = "2.7.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Kazu Yamamoto, Evan Borden";
      author = "";
      homepage = "https://github.com/haskell/network";
      url = "";
      synopsis = "Low-level networking interface";
      description = "This package provides a low-level networking interface.\n\nIn network-2.6 the @Network.URI@ module was split off into its own\npackage, network-uri-2.6. If you're using the @Network.URI@ module\nyou can automatically get it from the right package by adding this\nto your .cabal file:\n\n> library\n>   build-depends: network-uri-flag";
      buildType = "Configure";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ] ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (errorHandler.buildDepError "unix"));
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            ];
          buildable = true;
          };
        "doctest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
            ];
          buildable = true;
          };
        };
      };
    }