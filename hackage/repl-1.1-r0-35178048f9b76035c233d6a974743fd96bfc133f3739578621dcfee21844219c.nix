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
      specVersion = "1.8";
      identifier = { name = "repl"; version = "1.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "eleventynine@gmail.com";
      author = "Mike Ledger";
      homepage = "https://github.com/mikeplus64/repl";
      url = "";
      synopsis = "IRC friendly REPL library.";
      description = "Similar to mueval, but using a server with the GHC API instead of a command-line tool.\nAs a result, it is much faster than mueval.\nAdditionally, repl supports declarations/bindings (and deleting them), type and kind pretty printing, in addition to expression evaluation.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."haskell-src-exts" or (errorHandler.buildDepError "haskell-src-exts"))
          (hsPkgs."ghc-paths" or (errorHandler.buildDepError "ghc-paths"))
          ];
        buildable = true;
        };
      };
    }