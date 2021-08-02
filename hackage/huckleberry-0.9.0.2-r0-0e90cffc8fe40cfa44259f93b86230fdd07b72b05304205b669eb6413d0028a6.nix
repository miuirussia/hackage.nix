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
      identifier = { name = "huckleberry"; version = "0.9.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "tkms@mitsuji.org";
      author = "Takamasa Mitsuji";
      homepage = "";
      url = "";
      synopsis = "IchigoJam BASIC expressed in Haskell.";
      description = "The EDSL Provides bridge between IchigoJam BASIC and Haskell.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."serialport" or (errorHandler.buildDepError "serialport"))
          ];
        buildable = true;
        };
      tests = {
        "huckleberry-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."huckleberry" or (errorHandler.buildDepError "huckleberry"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            ];
          buildable = true;
          };
        };
      };
    }