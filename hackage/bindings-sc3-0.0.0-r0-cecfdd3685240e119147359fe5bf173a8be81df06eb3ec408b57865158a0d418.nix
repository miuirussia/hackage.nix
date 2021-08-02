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
      identifier = { name = "bindings-sc3"; version = "0.0.0"; };
      license = "LicenseRef-GPL";
      copyright = "Copyright (c) Stefan Kersten 2010";
      maintainer = "Stefan Kersten <sk@k-hornz.de>";
      author = "Stefan Kersten <sk@k-hornz.de>";
      homepage = "http://space.k-hornz.de/software/hsc3-process/";
      url = "";
      synopsis = "Bindings to the SuperCollider synthesis engine library.";
      description = "This library provides low level bindings to the SuperCollider synthesis engine library (@libscsynth@). If you are looking for a higher level Haskell interface, please use the hsc3-process package (<http://hackage.haskell.org/package/hsc3-process>).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bindings-DSL" or (errorHandler.buildDepError "bindings-DSL"))
          ];
        libs = [ (pkgs."scsynth" or (errorHandler.sysDepError "scsynth")) ];
        buildable = true;
        };
      };
    }