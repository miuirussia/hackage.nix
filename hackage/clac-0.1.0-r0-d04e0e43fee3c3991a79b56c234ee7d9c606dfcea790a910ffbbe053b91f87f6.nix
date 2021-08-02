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
      specVersion = "1.10";
      identifier = { name = "clac"; version = "0.1.0"; };
      license = "GPL-3.0-only";
      copyright = "Alexander Berntsen 2015";
      maintainer = "alexander@plaimi.net";
      author = "Alexander Berntsen";
      homepage = "";
      url = "";
      synopsis = "Simple CLI RPN calculator";
      description = "Simple CLI RPN calculator.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "clac" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."plailude" or (errorHandler.buildDepError "plailude"))
            (hsPkgs."safe" or (errorHandler.buildDepError "safe"))
            ];
          buildable = true;
          };
        };
      };
    }