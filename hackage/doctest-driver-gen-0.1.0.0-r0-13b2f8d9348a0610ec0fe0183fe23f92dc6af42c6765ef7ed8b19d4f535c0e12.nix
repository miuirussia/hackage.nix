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
      identifier = { name = "doctest-driver-gen"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2017 Hexirp";
      maintainer = "https://github.com/Hexirp/doctest-driver-gen/issues";
      author = "Hexirp";
      homepage = "https://github.com/Hexirp/doctest-driver-gen#readme";
      url = "";
      synopsis = "Generate doctest-driver.hs";
      description = "doctest-driver-gen is a doctest driver file generator.\nIt lets you automatically generate driver file for\ndoctest's cabal integration.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
          ];
        buildable = true;
        };
      exes = {
        "doctest-driver-gen" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."doctest-driver-gen" or (errorHandler.buildDepError "doctest-driver-gen"))
            ];
          buildable = true;
          };
        };
      tests = {
        "doctest-driver-gen-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."doctest" or (errorHandler.buildDepError "doctest"))
            (hsPkgs."doctest-driver-gen" or (errorHandler.buildDepError "doctest-driver-gen"))
            ];
          buildable = true;
          };
        };
      };
    }