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
      specVersion = "2.4";
      identifier = { name = "web-rep"; version = "0.8.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Tony Day <tonyday567@gmail.com>";
      author = "";
      homepage = "";
      url = "";
      synopsis = "representations of a web page";
      description = "An applicative-based, shared-data representation of a web page. ";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bifunctors" or (errorHandler.buildDepError "bifunctors"))
          (hsPkgs."box" or (errorHandler.buildDepError "box"))
          (hsPkgs."box-socket" or (errorHandler.buildDepError "box-socket"))
          (hsPkgs."clay" or (errorHandler.buildDepError "clay"))
          (hsPkgs."concurrency" or (errorHandler.buildDepError "concurrency"))
          (hsPkgs."generic-lens" or (errorHandler.buildDepError "generic-lens"))
          (hsPkgs."interpolatedstring-perl6" or (errorHandler.buildDepError "interpolatedstring-perl6"))
          (hsPkgs."language-javascript" or (errorHandler.buildDepError "language-javascript"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."lucid" or (errorHandler.buildDepError "lucid"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."scotty" or (errorHandler.buildDepError "scotty"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."wai-middleware-static" or (errorHandler.buildDepError "wai-middleware-static"))
          (hsPkgs."wai-websockets" or (errorHandler.buildDepError "wai-websockets"))
          (hsPkgs."websockets" or (errorHandler.buildDepError "websockets"))
          ];
        buildable = true;
        };
      exes = {
        "web-rep-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."optparse-generic" or (errorHandler.buildDepError "optparse-generic"))
            (hsPkgs."web-rep" or (errorHandler.buildDepError "web-rep"))
            ];
          buildable = true;
          };
        };
      };
    }