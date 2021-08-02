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
      identifier = { name = "levenshtein"; version = "0.1.2.0"; };
      license = "BSD-3-Clause";
      copyright = "2021 Willem Van Onsem";
      maintainer = "hapytexteu+gh@gmail.com";
      author = "Willem Van Onsem";
      homepage = "https://github.com/hapytex/levenshtein#readme";
      url = "";
      synopsis = "Calculate the edit distance between two foldables.";
      description = "A package to determine the edit distance between two 'Foldable's.\nThese are converted to lists, and the Levenshtein distance determine\nhow many additions, removals and changes are necessary to change\nthe first list into the second list.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          ];
        buildable = true;
        };
      tests = {
        "steinlevenh" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."levenshtein" or (errorHandler.buildDepError "levenshtein"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover.components.exes.hspec-discover or (pkgs.buildPackages.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
            ];
          buildable = true;
          };
        };
      };
    }