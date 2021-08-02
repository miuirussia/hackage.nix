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
      identifier = { name = "hdocs"; version = "0.5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "voidex@live.com";
      author = "Alexandr `Voidex` Ruchkin";
      homepage = "https://github.com/mvoidex/hdocs";
      url = "";
      synopsis = "Haskell docs tool";
      description = "Tool and library to get docs for installed packages and source files.\nCan return result in JSON format.\nCan dump docs for all installed modules\n\n@Usage:\nhdocs <module> - get docs for module/file\nhdocs <module> <name> - get docs for name in module/file\nhdocs dump [r] - dump all installed docs, if [r], find docs for reexported declarations\nflags\n-g GHC_OPT  --ghc=GHC_OPT  option to pass to GHC\n@";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."ghc-paths" or (errorHandler.buildDepError "ghc-paths"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ] ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).ge "8.0") [
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."haddock-api" or (errorHandler.buildDepError "haddock-api"))
          (hsPkgs."haddock-library" or (errorHandler.buildDepError "haddock-library"))
          ]) ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).lt "8.0") [
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."haddock-api" or (errorHandler.buildDepError "haddock-api"))
          (hsPkgs."haddock-library" or (errorHandler.buildDepError "haddock-library"))
          ];
        buildable = true;
        };
      exes = {
        "hdocs" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hdocs" or (errorHandler.buildDepError "hdocs"))
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."aeson-pretty" or (errorHandler.buildDepError "aeson-pretty"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."haddock-api" or (errorHandler.buildDepError "haddock-api"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hdocs" or (errorHandler.buildDepError "hdocs"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            ];
          buildable = true;
          };
        };
      };
    }