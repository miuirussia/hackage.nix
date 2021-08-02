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
    flags = { network-bytestring = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "http-proxy"; version = "0.0.11"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "erikd@mega-nerd.com";
      author = "Michael Snoyman, Stephen Blackheath, Erik de Castro Lopo";
      homepage = "https://github.com/erikd/http-proxy";
      url = "";
      synopsis = "A library for writing HTTP and HTTPS proxies";
      description = "http-proxy is a library for writing HTTP and HTTPS proxies.\n\nUse of the Conduit library provides file streaming via the proxy in both\ndirections. Memory usage of the proxy scales linearly with the number of\nsimultaneous connections and is independent of the size of the files being\nuploaded or downloaded.\n\nThe Settings data type provided by the library allows the caller to supply\na functions for exception reporting and request re-writing.  Eventually, this\ncapability will be expanded to allow optional logging, disk caching etc.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."http-conduit" or (errorHandler.buildDepError "http-conduit"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."blaze-builder" or (errorHandler.buildDepError "blaze-builder"))
          (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
          (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
          (hsPkgs."lifted-base" or (errorHandler.buildDepError "lifted-base"))
          (hsPkgs."blaze-builder-conduit" or (errorHandler.buildDepError "blaze-builder-conduit"))
          (hsPkgs."tls" or (errorHandler.buildDepError "tls"))
          (hsPkgs."bytestring-lexing" or (errorHandler.buildDepError "bytestring-lexing"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"))
          ] ++ (if flags.network-bytestring
          then [
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."network-bytestring" or (errorHandler.buildDepError "network-bytestring"))
            ]
          else [
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            ]);
        buildable = true;
        };
      };
    }