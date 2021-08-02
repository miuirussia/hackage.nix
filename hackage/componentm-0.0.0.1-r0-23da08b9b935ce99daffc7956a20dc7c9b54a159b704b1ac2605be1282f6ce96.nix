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
      identifier = { name = "componentm"; version = "0.0.0.1"; };
      license = "MIT";
      copyright = "© 2017-2018 Roman Gonzalez";
      maintainer = "open-source@roman-gonzalez.info";
      author = "Roman Gonzalez";
      homepage = "https://github.com/roman/Haskell-componentm#readme";
      url = "";
      synopsis = "Monad for allocation and cleanup of application resources";
      description = "This library allows you to allocate resources with\nclean up strategies when initializing your application.\nIt then provides a Monadic interface to compose multiple\nresources without having to deal with cleanup operations\nexplicitely.\n\nCheck Control.Monad.Component.Tutorial for an example and\nmore information.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
          (hsPkgs."rio" or (errorHandler.buildDepError "rio"))
          (hsPkgs."teardown" or (errorHandler.buildDepError "teardown"))
          ];
        buildable = true;
        };
      tests = {
        "componentm-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."componentm" or (errorHandler.buildDepError "componentm"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
            (hsPkgs."rio" or (errorHandler.buildDepError "rio"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."teardown" or (errorHandler.buildDepError "teardown"))
            ];
          buildable = true;
          };
        };
      };
    }