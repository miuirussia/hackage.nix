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
      identifier = { name = "lambdabot-trusted"; version = "5.1.0.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Bertram Felgenhauer <int-e@gmx.de>";
      author = "Bertram Felgenhauer";
      homepage = "https://wiki.haskell.org/Lambdabot";
      url = "";
      synopsis = "Lambdabot trusted code.";
      description = "Lambdabot is an IRC bot written over several years by\nthose on the #haskell IRC channel.\n\nThis small package provides functions used by\nthe \\@run command.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."oeis" or (errorHandler.buildDepError "oeis"))
          (hsPkgs."QuickCheck-safe" or (errorHandler.buildDepError "QuickCheck-safe"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
        buildable = true;
        };
      };
    }