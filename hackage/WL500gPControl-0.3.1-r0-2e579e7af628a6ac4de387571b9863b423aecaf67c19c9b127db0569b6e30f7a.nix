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
      identifier = { name = "WL500gPControl"; version = "0.3.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "";
      author = "Vasyl Pasternak <vasyl.pasternak@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "A simple command line tools to control the\nAsus WL500gP router";
      description = "";
      buildType = "Simple";
      };
    components = {
      exes = {
        "WL500gPStatus" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."WL500gPLibrary" or (errorHandler.buildDepError "WL500gPLibrary"))
            ];
          buildable = true;
          };
        "WL500gPControl" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."WL500gPLibrary" or (errorHandler.buildDepError "WL500gPLibrary"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            ];
          buildable = true;
          };
        };
      };
    }