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
      identifier = { name = "djinn-th"; version = "0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "claudiusmaximus@goto10.org";
      author = "Claude Heiland-Allen";
      homepage = "http://gitorious.org/djinn-th";
      url = "";
      synopsis = "Generate executable Haskell code from a type";
      description = "Djinn uses a theorem prover for intuitionistic\npropositional logic to generate a Haskell\nexpression when given a type.\n\nDjinn-TH uses Template Haskell to turn this\nexpression into executable code.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."logict" or (errorHandler.buildDepError "logict"))
          ];
        buildable = true;
        };
      };
    }