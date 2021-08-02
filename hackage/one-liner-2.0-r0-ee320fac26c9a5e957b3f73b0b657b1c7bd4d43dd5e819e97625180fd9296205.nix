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
      identifier = { name = "one-liner"; version = "2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "sjoerd@w3future.com";
      author = "Sjoerd Visscher, Xia Li-yao";
      homepage = "https://github.com/sjoerdvisscher/one-liner";
      url = "";
      synopsis = "Constraint-based generics";
      description = "Write short and concise generic instances of type classes.\none-liner is particularly useful for writing default\nimplementations of type class methods.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          (hsPkgs."linear-base" or (errorHandler.buildDepError "linear-base"))
          ];
        buildable = true;
        };
      tests = {
        "unittests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."contravariant" or (errorHandler.buildDepError "contravariant"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."one-liner" or (errorHandler.buildDepError "one-liner"))
            ];
          buildable = true;
          };
        };
      };
    }