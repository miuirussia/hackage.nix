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
    flags = { separatesyb = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "pointful"; version = "1.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Mikhail Glushenkov <the.dead.shall.rise@gmail.com>";
      author = "Mikhail Glushenkov";
      homepage = "http://github.com/23Skidoo/pointful";
      url = "";
      synopsis = "Pointful refactoring tool";
      description = "Stand-alone command-line version of the pointful plugin\nfor lambdabot.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "pointful" = {
          depends = [
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."haskell-src" or (errorHandler.buildDepError "haskell-src"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            ] ++ (if flags.separatesyb
            then [
              (hsPkgs."base" or (errorHandler.buildDepError "base"))
              (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
              ]
            else [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]);
          buildable = true;
          };
        };
      };
    }