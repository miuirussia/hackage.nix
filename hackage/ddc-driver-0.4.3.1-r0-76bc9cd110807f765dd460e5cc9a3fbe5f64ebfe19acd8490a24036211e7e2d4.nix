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
      specVersion = "1.6";
      identifier = { name = "ddc-driver"; version = "0.4.3.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "Ben Lippmeier <benl@ouroborus.net>";
      author = "The Disciplined Disciple Compiler Strike Force";
      homepage = "http://disciple.ouroborus.net";
      url = "";
      synopsis = "Disciplined Disciple Compiler top-level driver.";
      description = "This defines the top-level commands supported by the compiler,\nsuch as @-make@ and @-compile@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."ddc-core" or (errorHandler.buildDepError "ddc-core"))
          (hsPkgs."ddc-core-simpl" or (errorHandler.buildDepError "ddc-core-simpl"))
          (hsPkgs."ddc-core-salt" or (errorHandler.buildDepError "ddc-core-salt"))
          (hsPkgs."ddc-core-llvm" or (errorHandler.buildDepError "ddc-core-llvm"))
          (hsPkgs."ddc-core-flow" or (errorHandler.buildDepError "ddc-core-flow"))
          (hsPkgs."ddc-core-tetra" or (errorHandler.buildDepError "ddc-core-tetra"))
          (hsPkgs."ddc-source-tetra" or (errorHandler.buildDepError "ddc-source-tetra"))
          (hsPkgs."ddc-build" or (errorHandler.buildDepError "ddc-build"))
          ];
        buildable = true;
        };
      };
    }