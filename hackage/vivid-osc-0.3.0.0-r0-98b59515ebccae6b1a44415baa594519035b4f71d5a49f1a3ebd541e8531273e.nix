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
      identifier = { name = "vivid-osc"; version = "0.3.0.0"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Tom Murphy";
      author = "Tom Murphy";
      homepage = "";
      url = "";
      synopsis = "Open Sound Control encode/decode";
      description = "A small, simple, and well-tested implementation of the Open Sound Control\nmessage format.\n\nExample usage:\n\n@\n&#123;&#45;\\# LANGUAGE OverloadedStrings \\#&#45;&#125;\n@\n\n> import Network.Socket\n> import Network.Socket.ByteString as SB\n>\n> import Vivid.OSC\n>\n> main = do\n>    -- Boring Network.Socket setup:\n>    (a:_) <- getAddrInfo Nothing (Just \"127.0.0.1\") (Just \"57120\")\n>    s <- socket (addrFamily a) Datagram defaultProtocol\n>    connect s (addrAddress a)\n>\n>    -- The interesting part:\n>    SB.send s \$ encodeOSC \$\n>       OSC \"/play2\" [OSC_S \"cps\", OSC_I 1, OSC_S \"s\", OSC_S \"bd\"]";
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