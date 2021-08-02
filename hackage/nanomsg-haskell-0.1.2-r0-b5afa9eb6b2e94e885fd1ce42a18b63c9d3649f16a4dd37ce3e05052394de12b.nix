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
      identifier = { name = "nanomsg-haskell"; version = "0.1.2"; };
      license = "MIT";
      copyright = "Copyright (c) 2013 the nanomsg-haskell authors";
      maintainer = "<ivar.nymoen@gmail.com>";
      author = "See AUTHORS file";
      homepage = "https://github.com/ivarnymoen/nanomsg-haskell";
      url = "";
      synopsis = "Bindings to the nanomsg library";
      description = "This is a Haskell binding for the nanomsg library: <http://nanomsg.org/>.\nThere's support for blocking send and recv, a non-blocking receive,\nand for all the socket types and the functions you need to wire\nthem up and tear them down again.\nMost sockets options are available through accessor and mutator\nfunctions. Sockets are typed, transports are not.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
        libs = [ (pkgs."nanomsg" or (errorHandler.sysDepError "nanomsg")) ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."nanomsg-haskell" or (errorHandler.buildDepError "nanomsg-haskell"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (errorHandler.buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-th" or (errorHandler.buildDepError "test-framework-th"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "send-messages" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."nanomsg-haskell" or (errorHandler.buildDepError "nanomsg-haskell"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            ];
          buildable = true;
          };
        "vs-zeromq-bindings" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."nanomsg-haskell" or (errorHandler.buildDepError "nanomsg-haskell"))
            (hsPkgs."zeromq3-haskell" or (errorHandler.buildDepError "zeromq3-haskell"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            ];
          buildable = true;
          };
        };
      };
    }