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
        name = "phonetic-languages-simplified-properties-lists";
        version = "0.4.0.0";
        };
      license = "MIT";
      copyright = "";
      maintainer = "olexandr543@yahoo.com";
      author = "OleksandrZhabenko";
      homepage = "https://hackage.haskell.org/package/phonetic-languages-simplified-properties-lists";
      url = "";
      synopsis = "A generalization of the uniqueness-periods-vector-properties package.";
      description = "Is a simplified version of the functionality of the former one. Uses lists as main processment data. Please, consider switching to the phonetic-languages-simplified-examples-array package related functionality. It is still under development and introducing new advanced features being more optimized.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."phonetic-languages-rhythmicity" or (errorHandler.buildDepError "phonetic-languages-rhythmicity"))
          (hsPkgs."phonetic-languages-simplified-common" or (errorHandler.buildDepError "phonetic-languages-simplified-common"))
          (hsPkgs."ukrainian-phonetics-basic" or (errorHandler.buildDepError "ukrainian-phonetics-basic"))
          ];
        buildable = true;
        };
      };
    }