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
      identifier = { name = "ideas-math-types"; version = "1.1"; };
      license = "Apache-2.0";
      copyright = "(c) 2019";
      maintainer = "bastiaan.heeren@ou.nl";
      author = "Bastiaan Heeren, Alex Gerdes, Johan Jeuring, Josje Lodder";
      homepage = "http://ideas.cs.uu.nl/";
      url = "";
      synopsis = "Common types for mathematical domain reasoners";
      description = "This package provides common datatypes and utility functions for\nmathematical domain reasoners that are based on the 'ideas' software\npackage. The package is currently used by our logic tutors (dnf/cnf\nnormal forms, equational proofs, axiomatic proofs, inductive proofs),\nthe statistics tutor that provides feedback on the structure of\nhypothesis tests, and the analyzers of the Advise-Me project. Contact\nthe package maintainers for further information about the package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ideas" or (errorHandler.buildDepError "ideas"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.0")) (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"));
        buildable = true;
        };
      };
    }