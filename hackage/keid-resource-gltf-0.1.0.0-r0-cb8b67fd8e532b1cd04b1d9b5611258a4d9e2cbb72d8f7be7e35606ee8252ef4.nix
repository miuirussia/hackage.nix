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
      specVersion = "1.12";
      identifier = { name = "keid-resource-gltf"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2021 IC Rainbow";
      maintainer = "keid@aenor.ru";
      author = "IC Rainbow";
      homepage = "";
      url = "";
      synopsis = "GLTF loader for Keid engine.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."derive-storable" or (errorHandler.buildDepError "derive-storable"))
          (hsPkgs."derive-storable-plugin" or (errorHandler.buildDepError "derive-storable-plugin"))
          (hsPkgs."geomancy" or (errorHandler.buildDepError "geomancy"))
          (hsPkgs."gltf-codec" or (errorHandler.buildDepError "gltf-codec"))
          (hsPkgs."keid-core" or (errorHandler.buildDepError "keid-core"))
          (hsPkgs."rio" or (errorHandler.buildDepError "rio"))
          (hsPkgs."rio-app" or (errorHandler.buildDepError "rio-app"))
          (hsPkgs."vulkan" or (errorHandler.buildDepError "vulkan"))
          ];
        buildable = true;
        };
      };
    }