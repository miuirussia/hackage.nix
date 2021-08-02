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
    flags = { integer-simple = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "bytestring-show"; version = "0.3.5.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Dan Doel <dan.doel@gmail.com>";
      author = "Dan Doel";
      homepage = "http://code.haskell.org/~dolio/";
      url = "";
      synopsis = "Efficient conversion of values into readable byte strings.";
      description = "Efficient conversion of values into readable byte strings.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ] ++ (pkgs.lib).optional (flags.integer-simple) (hsPkgs."integer-simple" or (errorHandler.buildDepError "integer-simple"))) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "6.11" && !flags.integer-simple) (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))) ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "6.9" && (compiler.isGhc && (compiler.version).lt "6.11") && !flags.integer-simple) (hsPkgs."integer" or (errorHandler.buildDepError "integer"));
        buildable = true;
        };
      };
    }