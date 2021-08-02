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
      specVersion = "1.4";
      identifier = { name = "frown"; version = "0.6"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "strake888@gmail.com";
      author = "Ralf Hinze";
      homepage = "";
      url = "";
      synopsis = "LALR(k) parser generator";
      description = "";
      buildType = "Simple";
      };
    components = {
      exes = {
        "frown" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            ];
          buildable = true;
          };
        };
      };
    }