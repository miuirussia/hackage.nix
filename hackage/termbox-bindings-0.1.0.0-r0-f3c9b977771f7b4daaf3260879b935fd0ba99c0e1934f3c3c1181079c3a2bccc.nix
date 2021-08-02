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
      identifier = { name = "termbox-bindings"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "neuman.vong@gmail.com";
      author = "Neuman Vong";
      homepage = "github.com/luciferous/termbox-bindings";
      url = "";
      synopsis = "Bindings to the termbox library";
      description = "";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        libs = [ (pkgs."termbox" or (errorHandler.sysDepError "termbox")) ];
        build-tools = [
          (hsPkgs.buildPackages.c2hs.components.exes.c2hs or (pkgs.buildPackages.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")))
          ];
        buildable = true;
        };
      exes = {
        "example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."termbox-bindings" or (errorHandler.buildDepError "termbox-bindings"))
            ];
          buildable = true;
          };
        };
      };
    }