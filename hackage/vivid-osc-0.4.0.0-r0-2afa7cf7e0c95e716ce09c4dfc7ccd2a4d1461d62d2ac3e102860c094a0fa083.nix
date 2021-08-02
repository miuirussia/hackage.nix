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
      identifier = { name = "vivid-osc"; version = "0.4.0.0"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Tom Murphy";
      author = "Tom Murphy";
      homepage = "";
      url = "";
      synopsis = "Open Sound Control encode/decode";
      description = "Small, simple, and well-tested implementation of the Open Sound Control\nmessage format.\n\nExample usage:\n\n>>> :set -XOverloadedStrings\n>>> msg = OSC \"/foo\" [OSC_S \"bar\", OSC_I 9, OSC_F 0.25, OSC_B \"this-is-binary\"]\n>>> :t msg\n> msg :: OSC\n>>> :t encodeOSC msg\n> encodeOSC msg :: ByteString\n>>> decodeOSC (encodeOSC msg) == Right msg\n> True\n\nSee the README.md file for examples of sending and receiving with UDP";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
        buildable = true;
        };
      tests = {
        "vivid-osc-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."vivid-osc" or (errorHandler.buildDepError "vivid-osc"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
            (hsPkgs."microspec" or (errorHandler.buildDepError "microspec"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            ];
          buildable = true;
          };
        };
      };
    }