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
      identifier = { name = "jailbreak-cabal"; version = "1.3.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "simons@cryp.to";
      author = "Peter Simons, Jeremy Shaw, Joel Taylor, Kosyrev Serge, Nikolay Amiantov, aszlig";
      homepage = "https://github.com/peti/jailbreak-cabal";
      url = "";
      synopsis = "Strip version restrictions from Cabal files";
      description = "Strip version restrictions from build dependencies in Cabal files.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "jailbreak-cabal" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            ];
          buildable = true;
          };
        };
      };
    }