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
      specVersion = "1.4";
      identifier = { name = "WebBits-multiplate"; version = "0.0.0.1"; };
      license = "MIT";
      copyright = "2011, Balazs Endresz";
      maintainer = "Balazs Endresz <balazs.endresz@gmail.com>";
      author = "Balazs Endresz";
      homepage = "";
      url = "";
      synopsis = "A Multiplate instance for JavaScript.";
      description = "Provides a Multiplate instance for the JavaScript AST in the WebBits package.\nThe MultiplateSimplified module is based on the multiplate-simplified package,\nwhich makes it a bit more readable, and easier to work with\nbut the extra type class it uses might affect performance.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."multiplate" or (errorHandler.buildDepError "multiplate"))
          (hsPkgs."multiplate-simplified" or (errorHandler.buildDepError "multiplate-simplified"))
          (hsPkgs."WebBits" or (errorHandler.buildDepError "WebBits"))
          ];
        buildable = true;
        };
      };
    }