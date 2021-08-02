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
      identifier = { name = "hspec-parsec"; version = "0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2019 Simon Jakobi";
      maintainer = "simon.jakobi@gmail.com";
      author = "Simon Jakobi, Mark Karpov";
      homepage = "https://github.com/sjakobi/hspec-parsec#readme";
      url = "";
      synopsis = "Hspec expectations for testing Parsec parsers";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hspec-expectations" or (errorHandler.buildDepError "hspec-expectations"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-parsec" or (errorHandler.buildDepError "hspec-parsec"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            ];
          buildable = true;
          };
        };
      };
    }