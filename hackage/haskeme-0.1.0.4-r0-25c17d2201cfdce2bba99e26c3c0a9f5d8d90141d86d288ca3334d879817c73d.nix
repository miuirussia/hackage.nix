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
      identifier = { name = "haskeme"; version = "0.1.0.4"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "felixspringer149@gmail.com";
      author = "Felix Springer";
      homepage = "https://github.com/jumper149/haskeme";
      url = "";
      synopsis = "Compiler from I- to S-Expressions for the Scheme Programming Language";
      description = "This compiler translates Scheme source code written with I-Expressions (indented expressions) into S-Expressions (symbolic expressions).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      exes = {
        "haskeme" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."haskeme" or (errorHandler.buildDepError "haskeme"))
            ];
          buildable = true;
          };
        };
      };
    }