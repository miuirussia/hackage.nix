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
      identifier = { name = "chell-hunit"; version = "0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "";
      author = "John Millikin <jmillikin@gmail.com>";
      homepage = "https://john-millikin.com/software/chell/";
      url = "";
      synopsis = "Quiet test runner (HUnit support)";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."chell" or (errorHandler.buildDepError "chell"))
          (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          ];
        buildable = true;
        };
      };
    }