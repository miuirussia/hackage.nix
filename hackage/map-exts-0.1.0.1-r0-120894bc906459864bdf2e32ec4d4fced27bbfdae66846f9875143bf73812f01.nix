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
      identifier = { name = "map-exts"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2016 Elsen, Inc";
      maintainer = "cooper.charles.m@gmail.com";
      author = "Charles Cooper";
      homepage = "http://github.com/elsen-trading/map-extensions#readme";
      url = "";
      synopsis = "Extensions to Data.Map";
      description = "Extensions to Data.Map";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
        buildable = true;
        };
      exes = {
        "example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            ];
          buildable = true;
          };
        "titanic-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."cassava" or (errorHandler.buildDepError "cassava"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      };
    }