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
      specVersion = "1.2";
      identifier = { name = "hinduce-examples"; version = "0.0.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "hackage@roberthensing.nl";
      author = "Robert Hensing";
      homepage = "";
      url = "";
      synopsis = "Example data for hInduce";
      description = "Example data for use with hInduce";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."layout" or (errorHandler.buildDepError "layout"))
          (hsPkgs."hinduce-missingh" or (errorHandler.buildDepError "hinduce-missingh"))
          (hsPkgs."csv" or (errorHandler.buildDepError "csv"))
          (hsPkgs."hinduce-classifier" or (errorHandler.buildDepError "hinduce-classifier"))
          (hsPkgs."hinduce-classifier-decisiontree" or (errorHandler.buildDepError "hinduce-classifier-decisiontree"))
          (hsPkgs."hinduce-associations-apriori" or (errorHandler.buildDepError "hinduce-associations-apriori"))
          (hsPkgs."convertible" or (errorHandler.buildDepError "convertible"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
        buildable = true;
        };
      };
    }