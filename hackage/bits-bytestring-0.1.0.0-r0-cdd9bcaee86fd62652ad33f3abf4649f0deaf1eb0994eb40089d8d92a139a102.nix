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
      identifier = { name = "bits-bytestring"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2016 Michael Carpenter";
      maintainer = "Michael Carpenter <oldmanmike.dev@gmail.com>";
      author = "Michael Carpenter";
      homepage = "https://github.com/oldmanmike/bits-bytestring";
      url = "";
      synopsis = "Bits instance for bytestrings.";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bits" or (errorHandler.buildDepError "bits"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
        buildable = true;
        };
      tests = {
        "bits-bytestring-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bits" or (errorHandler.buildDepError "bits"))
            (hsPkgs."bits-bytestring" or (errorHandler.buildDepError "bits-bytestring"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bits-bytestring-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."bits-bytestring" or (errorHandler.buildDepError "bits-bytestring"))
            ];
          buildable = true;
          };
        };
      };
    }