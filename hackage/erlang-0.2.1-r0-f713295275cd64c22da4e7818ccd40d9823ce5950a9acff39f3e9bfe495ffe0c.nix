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
      identifier = { name = "erlang"; version = "0.2.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Artúr Poór <gombocarti@gmail.com>";
      author = "Eric Sessoms <nubgames@gmail.com>";
      homepage = "http://github.com/gombocarti/erlang-ffi";
      url = "";
      synopsis = "FFI interface to Erlang.";
      description = "Speaks the Erlang network protocol and impersonates an Erlang node\non the network.  Fully capable of bi-directional communication with\nErlang.  Erlang types are, as far as reasonable, mapped to Haskell\ntypes.  Messages to Erlang are just function calls in Haskell, and\nmessages from Erlang are delivered to MVars.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."MissingH" or (errorHandler.buildDepError "MissingH"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          ];
        buildable = true;
        };
      };
    }