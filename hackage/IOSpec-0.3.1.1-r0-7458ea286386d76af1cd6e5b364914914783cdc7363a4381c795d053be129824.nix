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
      identifier = { name = "IOSpec"; version = "0.3.1.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Bertram Felgenhauer <int-e@gmx.de>";
      author = "Wouter Swierstra,\nYusaku Hashimoto,\nNikolay Amiantov,\nBertram Felgenhauer";
      homepage = "https://github.com/lambdabot/IOSpec";
      url = "";
      synopsis = "A pure specification of the IO monad.";
      description = "This package consists of several modules, that give a\npure specification of functions in the IO monad:\n\n* \"Test.IOSpec.Fork\": a pure specification of\n'forkIO'.\n* \"Test.IOSpec.IORef\": a pure specification of most\nfunctions that create and manipulate on 'IORefs'.\n* \"Test.IOSpec.MVar\": a pure specification of most\nfunctions that create and manipulate and 'MVars'.\n* \"Test.IOSpec.STM\": a pure specification of\n'atomically' and the 'STM' monad.\n* \"Test.IOSpec.Teletype\": a pure specification of\n'getChar', 'putChar', and several related\nPrelude functions.\n\nBesides these modules containing the specifications,\nthere are a few other important modules:\n\n* \"Test.IOSpec.Types\": defines the 'IOSpec' type and\nseveral amenities.\n* \"Test.IOSpec.VirtualMachine\": defines a virtual\nmachine on which to execute pure specifications.\n* \"Test.IOSpec.Surrogate\": a drop-in replacement for\nthe other modules. Import this and recompile your\ncode once you've finished testing and debugging.\n\nThere are several well-documented examples included\nwith the source distribution.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."Stream" or (errorHandler.buildDepError "Stream"))
          ];
        buildable = true;
        };
      };
    }