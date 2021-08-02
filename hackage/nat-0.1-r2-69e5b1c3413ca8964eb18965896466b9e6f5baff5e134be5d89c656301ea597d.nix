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
      specVersion = "1.0";
      identifier = { name = "nat"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Jan Christiansen <jac@informatik.uni-kiel.de>";
      author = "Andres Löh, Frank Huch, Jan Christiansen    ";
      homepage = "";
      url = "";
      synopsis = "Lazy binary natural numbers";
      description = "Implementation of natural numbers and integers by a binary\nrepresentation. The implementation is supposed to be lazy and\nreasonable efficient (in comparison to peano numbers). This\nimplementation is inspired by a similar approach in the functional\nlogic programming language Curry.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      };
    }