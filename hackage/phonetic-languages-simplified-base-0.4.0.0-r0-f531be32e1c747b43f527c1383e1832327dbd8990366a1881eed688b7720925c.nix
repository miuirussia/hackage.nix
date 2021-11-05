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
        name = "phonetic-languages-simplified-base";
        version = "0.4.0.0";
        };
      license = "MIT";
      copyright = "Oleksandr Zhabenko";
      maintainer = "olexandr543@yahoo.com";
      author = "OleksandrZhabenko";
      homepage = "https://hackage.haskell.org/package/phonetic-languages-simlified-base";
      url = "";
      synopsis = "A basics of the phonetic-languages functionality.";
      description = "The  common for different realizations functionality. Just the necessary one.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."subG" or (errorHandler.buildDepError "subG"))
          (hsPkgs."phonetic-languages-permutations-array" or (errorHandler.buildDepError "phonetic-languages-permutations-array"))
          ];
        buildable = true;
        };
      };
    }