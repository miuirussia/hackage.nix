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
      identifier = { name = "PropLogic"; version = "0.9"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "b@bucephalus.org";
      author = "bucephalus";
      homepage = "http://www.bucephalus.org/PropLogic";
      url = "";
      synopsis = "A system for propositional logic with default and fast instances of propositional algebras.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
          ];
        buildable = true;
        };
      exes = { "program" = { buildable = true; }; };
      };
    }