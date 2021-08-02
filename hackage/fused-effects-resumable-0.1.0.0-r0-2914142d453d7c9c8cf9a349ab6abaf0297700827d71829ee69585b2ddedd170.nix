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
      specVersion = "2.0";
      identifier = { name = "fused-effects-resumable"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2019 Rob Rix and Patrick Thomson";
      maintainer = "patrickt@github.com";
      author = "Rob Rix and Patrick Thomson";
      homepage = "https://github.com/fused-effects/fused-effects-resumable";
      url = "";
      synopsis = "Resumable exceptions for the fused-effects ecosystem.";
      description = "Provides an effect and carrier capable of resuming control flow from an exceptoin handler.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."fused-effects" or (errorHandler.buildDepError "fused-effects"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        buildable = true;
        };
      };
    }