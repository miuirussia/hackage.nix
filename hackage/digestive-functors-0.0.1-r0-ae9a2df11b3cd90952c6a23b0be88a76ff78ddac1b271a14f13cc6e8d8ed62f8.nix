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
      identifier = { name = "digestive-functors"; version = "0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "jaspervdj@gmail.com";
      author = "Jasper Van der Jeugt";
      homepage = "http://github.com/jaspervdj/digestive-functors";
      url = "";
      synopsis = "A general way to consume input using applicative functors";
      description = "Digestive functors is a library to generate and process\nHTML forms.  You can find an introduction here:\n<http://github.com/jaspervdj/digestive-functors/blob/master/README.lhs>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."blaze-html" or (errorHandler.buildDepError "blaze-html"))
          (hsPkgs."monads-fd" or (errorHandler.buildDepError "monads-fd"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
        buildable = true;
        };
      };
    }