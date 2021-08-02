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
      identifier = { name = "todo"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "jonathan.skarstedt@gmail.com";
      author = "Jonathan Skårstedt";
      homepage = "";
      url = "";
      synopsis = "A todo bottom.";
      description = "This library provides \"todo:s\", wrapping error and undefined,\nand throws compile time warnings on todo:s still in your code.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      };
    }