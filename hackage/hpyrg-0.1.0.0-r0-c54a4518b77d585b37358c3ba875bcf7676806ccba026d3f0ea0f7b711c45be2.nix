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
      identifier = { name = "hpyrg"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "matvey.aksenov@gmail.com";
      author = "Matvey Aksenov";
      homepage = "";
      url = "";
      synopsis = "pyrg utility done right";
      description = "hpyrg is a pyrg analog written in Haskell.\n\npyrg is an utility which colorizes Python unittest module's unit tests output. It has a few fatal flaws:\n\n* It cannot into lazy IO\n\n* It cannot into really verbose colorization\n\nTo address these issues there is hpyrg.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hpyrg" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            ];
          buildable = true;
          };
        };
      };
    }