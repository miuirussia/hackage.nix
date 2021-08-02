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
    flags = { debug = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "hasktags"; version = "0.68.7"; };
      license = "BSD-3-Clause";
      copyright = "The University Court of the University of Glasgow";
      maintainer = "Marc Weber <marco-oweber@gmx.de>,\nMarco Túlio Pimenta Gontijo <marcotmarcot@gmail.com>";
      author = "The GHC Team";
      homepage = "http://github.com/MarcWeber/hasktags";
      url = "";
      synopsis = "Produces ctags \"tags\" and etags \"TAGS\" files for Haskell programs";
      description = "Produces ctags \"tags\" and etags \"TAGS\" files for Haskell programs.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hasktags" = {
          depends = [
            (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."json" or (errorHandler.buildDepError "json"))
            ] ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (errorHandler.buildDepError "unix"));
          buildable = true;
          };
        };
      };
    }