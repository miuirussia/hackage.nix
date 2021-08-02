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
      identifier = { name = "tupleinstances"; version = "0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "diegoeche@gmail.com";
      author = "Diego Echeverri";
      homepage = "http://github.com/diegoeche/tupleinstances";
      url = "";
      synopsis = "Functor, Applicative and Monad for n-ary tuples.";
      description = "Functor, Applicative and Monad for n-ary tuples.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          ];
        buildable = true;
        };
      };
    }