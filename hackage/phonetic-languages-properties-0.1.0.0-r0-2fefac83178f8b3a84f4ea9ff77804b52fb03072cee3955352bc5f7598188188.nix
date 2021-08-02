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
      identifier = {
        name = "phonetic-languages-properties";
        version = "0.1.0.0";
        };
      license = "MIT";
      copyright = "";
      maintainer = "olexandr543@yahoo.com";
      author = "OleksandrZhabenko";
      homepage = "https://hackage.haskell.org/package/phonetic-languages-properties";
      url = "";
      synopsis = "A generalization of the uniqueness-periods-vector-properties package.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."phonetic-languages-vector" or (errorHandler.buildDepError "phonetic-languages-vector"))
          (hsPkgs."phonetic-languages-rhythmicity" or (errorHandler.buildDepError "phonetic-languages-rhythmicity"))
          (hsPkgs."phonetic-languages-common" or (errorHandler.buildDepError "phonetic-languages-common"))
          (hsPkgs."ukrainian-phonetics-basic" or (errorHandler.buildDepError "ukrainian-phonetics-basic"))
          ];
        buildable = true;
        };
      };
    }