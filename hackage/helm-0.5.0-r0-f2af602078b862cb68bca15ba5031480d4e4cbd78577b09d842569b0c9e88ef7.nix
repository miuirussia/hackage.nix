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
      identifier = { name = "helm"; version = "0.5.0"; };
      license = "MIT";
      copyright = "(c) 2013, Zack Corr";
      maintainer = "Zack Corr <zack@z0w0.me>";
      author = "Zack Corr";
      homepage = "http://github.com/z0w0/helm";
      url = "";
      synopsis = "A functionally reactive game engine.";
      description = "A functionally reactive game engine, with headgear to protect you\nfrom the headache of game development provided.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."cairo" or (errorHandler.buildDepError "cairo"))
          (hsPkgs."pango" or (errorHandler.buildDepError "pango"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."elerea" or (errorHandler.buildDepError "elerea"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."SDL" or (errorHandler.buildDepError "SDL"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ];
        buildable = true;
        };
      tests = {
        "helm-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
            (hsPkgs."elerea" or (errorHandler.buildDepError "elerea"))
            (hsPkgs."SDL" or (errorHandler.buildDepError "SDL"))
            ];
          buildable = true;
          };
        };
      };
    }