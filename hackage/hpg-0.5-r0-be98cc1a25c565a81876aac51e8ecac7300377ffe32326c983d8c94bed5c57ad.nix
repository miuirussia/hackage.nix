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
    flags = { warn-as-error = false; };
    package = {
      specVersion = "1.12";
      identifier = { name = "hpg"; version = "0.5"; };
      license = "ISC";
      copyright = "";
      maintainer = "fritjof@alokat.org";
      author = "Fritjof Bornebusch";
      homepage = "https://darcs.alokat.org/hpg";
      url = "";
      synopsis = "password generator";
      description = "the haskell password generator.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hpg" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            ] ++ (pkgs.lib).optional (system.isOpenbsd) (hsPkgs."unix" or (errorHandler.buildDepError "unix"));
          buildable = true;
          };
        };
      };
    }