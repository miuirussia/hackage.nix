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
      identifier = { name = "repl-toolkit"; version = "0.1.0.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "janos.tapolczai@gmail.com";
      author = "Janos Tapolczai";
      homepage = "https://github.com/ombocomp/repl-toolkit";
      url = "";
      synopsis = "Toolkit for quickly whipping up command-line interfaces.";
      description = "A simple toolkit for quickly whipping up REPLs, input validation and sets of commands included.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."functor-monadic" or (errorHandler.buildDepError "functor-monadic"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."ListLike" or (errorHandler.buildDepError "ListLike"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."numericpeano" or (errorHandler.buildDepError "numericpeano"))
          (hsPkgs."listsafe" or (errorHandler.buildDepError "listsafe"))
          (hsPkgs."monad-loops" or (errorHandler.buildDepError "monad-loops"))
          ];
        buildable = true;
        };
      };
    }