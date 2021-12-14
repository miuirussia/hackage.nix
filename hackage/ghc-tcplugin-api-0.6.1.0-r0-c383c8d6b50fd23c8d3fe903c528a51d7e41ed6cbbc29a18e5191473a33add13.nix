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
      specVersion = "3.0";
      identifier = { name = "ghc-tcplugin-api"; version = "0.6.1.0"; };
      license = "BSD-3-Clause";
      copyright = "2021 Sam Derbyshire";
      maintainer = "Sam Derbyshire";
      author = "Sam Derbyshire";
      homepage = "https://github.com/sheaf/ghc-tcplugin-api";
      url = "";
      synopsis = "An API for type-checker plugins.";
      description = "This library provides a streamlined monadic interface\nfor writing GHC type-checking plugins.\n\nEach stage in a type-checking plugin (initialisation, solving, rewriting,\nshutdown) has a corresponding monad, preventing operations that are only\nallowed in some stages to be used in the other stages.\nOperations that work across multiple stages are overloaded across monads\nusing MTL-like typeclasses.\n\nSome operations, like creating evidence for constraints or creating\ncustom type error messages, are also simplified.\n\nPlease refer to the <https://github.com/sheaf/ghc-tcplugin-api associated GitHub repository>\nfor example usage.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        buildable = true;
        };
      };
    }