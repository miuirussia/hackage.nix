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
      identifier = {
        name = "essence-of-live-coding-pulse-example";
        version = "0.2.4";
        };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "programming@manuelbaerenz.de";
      author = "Manuel Bärenz";
      homepage = "https://www.manuelbaerenz.de/#computerscience";
      url = "";
      synopsis = "General purpose live coding framework - pulse backend example";
      description = "essence-of-live-coding is a general purpose and type safe live coding framework.\n\nYou can run programs in it, and edit, recompile and reload them while they're running.\nInternally, the state of the live program is automatically migrated when performing hot code swap.\n\nThe library also offers an easy to use FRP interface.\nIt is parametrized by its side effects,\nseparates data flow cleanly from control flow,\nand allows to develop live programs from reusable, modular components.\nThere are also useful utilities for debugging and quickchecking.\n\nThis package contains an example for PulseAudio backend.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "essence-of-live-coding-pulse-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."pulse-simple" or (errorHandler.buildDepError "pulse-simple"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."essence-of-live-coding" or (errorHandler.buildDepError "essence-of-live-coding"))
            (hsPkgs."essence-of-live-coding-pulse" or (errorHandler.buildDepError "essence-of-live-coding-pulse"))
            ];
          buildable = true;
          };
        };
      };
    }