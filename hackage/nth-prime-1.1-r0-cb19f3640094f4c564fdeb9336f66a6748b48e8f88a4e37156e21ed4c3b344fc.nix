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
      specVersion = "1.8";
      identifier = { name = "nth-prime"; version = "1.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "Joe Leslie-Hurd <joe@gilith.com>";
      author = "Joe Leslie-Hurd <joe@gilith.com>";
      homepage = "";
      url = "";
      synopsis = "Computing the nth prime";
      description = "This package implements a simple utility to compute the nth prime.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "nth-prime" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."opentheory-primitive" or (errorHandler.buildDepError "opentheory-primitive"))
            (hsPkgs."opentheory-prime" or (errorHandler.buildDepError "opentheory-prime"))
            ];
          buildable = true;
          };
        };
      tests = {
        "nth-prime-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."opentheory-primitive" or (errorHandler.buildDepError "opentheory-primitive"))
            (hsPkgs."opentheory-prime" or (errorHandler.buildDepError "opentheory-prime"))
            ];
          buildable = true;
          };
        };
      };
    }