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
    flags = { ghcapi = true; ghc7 = true; readfile = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "MagicHaskeller"; version = "0.9.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Susumu Katayama <skata@cs.miyazaki-u.ac.jp>";
      author = "Susumu Katayama";
      homepage = "http://nautilus.cs.miyazaki-u.ac.jp/~skata/MagicHaskeller.html";
      url = "";
      synopsis = "Automatic inductive functional programmer by systematic search";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."html" or (errorHandler.buildDepError "html"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          ] ++ (pkgs.lib).optionals (flags.ghcapi && !system.isWindows) [
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."ghc-paths" or (errorHandler.buildDepError "ghc-paths"))
          ]) ++ (pkgs.lib).optional (flags.readfile) (hsPkgs."haskell-src" or (errorHandler.buildDepError "haskell-src"))) ++ (pkgs.lib).optional (flags.ghc7) (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"));
        buildable = true;
        };
      };
    }