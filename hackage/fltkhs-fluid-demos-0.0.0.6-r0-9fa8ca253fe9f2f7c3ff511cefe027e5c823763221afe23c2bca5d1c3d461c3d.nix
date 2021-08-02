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
    flags = { fastcompile = true; };
    package = {
      specVersion = "1.20";
      identifier = { name = "fltkhs-fluid-demos"; version = "0.0.0.6"; };
      license = "MIT";
      copyright = "";
      maintainer = "aditya.siram@gmail.com";
      author = "Aditya Siram";
      homepage = "http://github.com/deech/fltkhs-fluid-demos";
      url = "";
      synopsis = "Fltkhs Fluid Demos";
      description = "Examples of using Fluid with FLTKHS";
      buildType = "Custom";
      };
    components = {
      exes = {
        "fltkhs-fluid-radio" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."fltkhs" or (errorHandler.buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-fluid-tabs" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."fltkhs" or (errorHandler.buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-fluid-valuators" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."fltkhs" or (errorHandler.buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-fluid-inactive" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."fltkhs" or (errorHandler.buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-fluid-fast-slow" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."fltkhs" or (errorHandler.buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-fluid-tree" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."fltkhs" or (errorHandler.buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        };
      };
    }