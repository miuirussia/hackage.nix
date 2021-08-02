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
      identifier = { name = "machinecell"; version = "1.1.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2014 Hidenori Azuma";
      maintainer = "Hidenori Azuma <as.capabl@gmail.com>";
      author = "Hidenori Azuma";
      homepage = "http://github.com/as-capabl/machinecell";
      url = "";
      synopsis = "Arrow based stream transducers";
      description = "Stream processing library similar to pipes, couduit, or machines.\n\nArrow combinatins are supported and can be used with the arrow notation.\nAFRP-like utilities are also available.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."free" or (errorHandler.buildDepError "free"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."machinecell" or (errorHandler.buildDepError "machinecell"))
            ];
          buildable = true;
          };
        };
      };
    }