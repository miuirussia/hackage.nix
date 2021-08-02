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
      identifier = { name = "hpc-strobe"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "naur@post11.tele.dk";
      author = "Thorkil Naur";
      homepage = "";
      url = "";
      synopsis = "Hpc-generated strobes for a running Haskell program";
      description = "A rudimentary library that demonstrates the\npossibility of using Hpc (Haskell Program Coverage)\nto inspect the state of a running Haskell program.\nUse of the library involves a simple change of the\nmain function and also requires the program to be\nenabled for hpc. At the time of writing, this means\nusing a fairly recent version of GHC and compiling\nthe Haskell code with the @-fhpc@ option.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hpc" or (errorHandler.buildDepError "hpc"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ];
        buildable = true;
        };
      };
    }