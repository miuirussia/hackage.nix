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
      identifier = { name = "atmos"; version = "0.4.0.0"; };
      license = "LicenseRef-PublicDomain";
      copyright = "(c) Greg Horn 2012-2015";
      maintainer = "gregmainland@gmail.com";
      author = "Greg Horn";
      homepage = "";
      url = "";
      synopsis = "1976 US Standard Atmosphere Model";
      description = "1976 US Standard Atmosphere Model.\n\nAdapted by Greg Horn from original programs by Ralph L. Carmichael,\nPublic Domain Aeronautical Software.\n\nThe original code can be found at <http://www.pdas.com/atmos.html>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."dimensional" or (errorHandler.buildDepError "dimensional"))
          ];
        buildable = true;
        };
      tests = {
        "unit-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."atmos" or (errorHandler.buildDepError "atmos"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            ];
          buildable = true;
          };
        };
      };
    }