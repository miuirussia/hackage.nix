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
      identifier = { name = "darcsden"; version = "0.4"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "i.am@toogeneric.com";
      author = "Alex Suraci";
      homepage = "http://darcsden.com/";
      url = "";
      synopsis = "darcs project hosting and collaboration";
      description = "A web and SSH server for hosting darcs projects and collaborating with\nothers.\n\nSee darcsden --readme for installation instructions.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "darcsden" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base64-string" or (errorHandler.buildDepError "base64-string"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."CouchDB" or (errorHandler.buildDepError "CouchDB"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."darcs" or (errorHandler.buildDepError "darcs"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."harp" or (errorHandler.buildDepError "harp"))
            (hsPkgs."hashed-storage" or (errorHandler.buildDepError "hashed-storage"))
            (hsPkgs."hsp" or (errorHandler.buildDepError "hsp"))
            (hsPkgs."json" or (errorHandler.buildDepError "json"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
            (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
            (hsPkgs."pandoc" or (errorHandler.buildDepError "pandoc"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."redis" or (errorHandler.buildDepError "redis"))
            (hsPkgs."SHA" or (errorHandler.buildDepError "SHA"))
            (hsPkgs."ssh" or (errorHandler.buildDepError "ssh"))
            (hsPkgs."snap-core" or (errorHandler.buildDepError "snap-core"))
            (hsPkgs."snap-server" or (errorHandler.buildDepError "snap-server"))
            (hsPkgs."system-uuid" or (errorHandler.buildDepError "system-uuid"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."xhtml" or (errorHandler.buildDepError "xhtml"))
            ];
          buildable = true;
          };
        "darcsden-ssh" = { buildable = true; };
        };
      };
    }