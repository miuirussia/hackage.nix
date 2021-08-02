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
      identifier = { name = "explicit-sharing"; version = "0.7"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "sebf@informatik.uni-kiel.de";
      author = "Chung-chieh Shan, Oleg Kiselyov, and Sebastian Fischer";
      homepage = "http://sebfisch.github.com/explicit-sharing";
      url = "";
      synopsis = "Explicit Sharing of Monadic Effects";
      description = "This package implements a monad transformer for sharing monadic\neffects.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."derive" or (errorHandler.buildDepError "derive"))
          ];
        buildable = true;
        };
      };
    }