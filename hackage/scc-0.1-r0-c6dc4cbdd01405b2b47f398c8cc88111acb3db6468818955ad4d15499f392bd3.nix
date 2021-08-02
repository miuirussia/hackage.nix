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
      identifier = { name = "scc"; version = "0.1"; };
      license = "LicenseRef-GPL";
      copyright = "(c) 2008 Mario Blazevic";
      maintainer = "blamario@yahoo.com";
      author = "Mario Blazevic";
      homepage = "";
      url = "";
      synopsis = "Streaming component combinators";
      description = "SCC is a layered library of Streaming Component Combinators. The lowest layer defines a Pipe monad transformer that\nenables building of producer-consumer coroutine pairs. The next layer adds streaming component\ntypes, a number of primitive streaming components and a set of component combinators. Finally,\nthere is an executable that exposes all functionality in a command-line shell.\n\nThe library design is based on paper <http://www.idealliance.org/papers/extreme/Proceedings/html/2006/Blazevic01/EML2006Blazevic01.html>\n\nMario Bla&#382;evi&#263;, Streaming component combinators, Extreme Markup Languages, 2006.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
        buildable = true;
        };
      exes = {
        "shsh" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."readline" or (errorHandler.buildDepError "readline"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            ];
          buildable = true;
          };
        };
      };
    }