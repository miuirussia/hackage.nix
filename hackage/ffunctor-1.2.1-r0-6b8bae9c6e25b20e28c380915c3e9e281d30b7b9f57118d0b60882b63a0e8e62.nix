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
    flags = { transformers = true; };
    package = {
      specVersion = "2.2";
      identifier = { name = "ffunctor"; version = "1.2.1"; };
      license = "BSD-3-Clause";
      copyright = "2019 Sam Halliday";
      maintainer = "Sam Halliday";
      author = "Sam Halliday";
      homepage = "";
      url = "";
      synopsis = "FFunctor typeclass";
      description = "Micro library with a Higher Kinded Functor in the spirit of HFunctor,\nMFunctor and MonadTrans (which all have different kindedness).\n\nUseful to map over the type parameter in a record of functions\n\n* https://www.benjamin.pizza/posts/2017-12-15-functor-functors.html\n* https://discourse.haskell.org/t/local-capabilities-with-mtl/231\n* https://discourse.haskell.org/t/some-limits-of-mtl-with-records-of-functions/576\n* https://discourse.haskell.org/t/records-of-functions-and-implicit-parameters/747";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          ] ++ (pkgs.lib).optional (flags.transformers) (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"));
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."ffunctor" or (errorHandler.buildDepError "ffunctor"))
            (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."servant" or (errorHandler.buildDepError "servant"))
            (hsPkgs."servant-client" or (errorHandler.buildDepError "servant-client"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hspec" or (errorHandler.buildDepError "tasty-hspec"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."universum" or (errorHandler.buildDepError "universum"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.tasty-discover.components.exes.tasty-discover or (pkgs.buildPackages.tasty-discover or (errorHandler.buildToolDepError "tasty-discover:tasty-discover")))
            ];
          buildable = true;
          };
        };
      };
    }