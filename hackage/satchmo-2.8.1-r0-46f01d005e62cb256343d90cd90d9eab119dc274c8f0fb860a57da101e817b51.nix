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
      identifier = { name = "satchmo"; version = "2.8.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Johannes Waldmann";
      author = "Pepe Iborra, Johannes Waldmann, Alexander Bau";
      homepage = "<https://github.com/jwaldmann/satchmo>";
      url = "";
      synopsis = "SAT encoding monad";
      description = "Encoding for boolean and integral constraints into CNF-SAT.\nThe encoder is provided as a State monad\n(hence the \"mo\" in \"satchmo\").\nThis package depends on minisat-haskell-bindings, see\n<https://github.com/niklasso/minisat-haskell-bindings>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."minisat" or (errorHandler.buildDepError "minisat"))
          ];
        buildable = true;
        };
      };
    }