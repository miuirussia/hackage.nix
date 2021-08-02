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
    flags = { debug = false; testexamples = false; };
    package = {
      specVersion = "2.0";
      identifier = { name = "arrowp-qq"; version = "0.3.0"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "John 'Ski <riuga@tuta.io>";
      author = "Jose Iborra <pepeiborra@gmail.com>";
      homepage = "https://github.com/pepeiborra/arrowp";
      url = "";
      synopsis = "A preprocessor and quasiquoter for translating arrow notation";
      description = "A suite of preprocessor and quasiquoter to desugar arrow notation built on top of Ross Paterson's arrowp and the venerable haskell-src-exts.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."NoHoed" or (errorHandler.buildDepError "NoHoed"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."haskell-src-exts" or (errorHandler.buildDepError "haskell-src-exts"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."haskell-src-exts-util" or (errorHandler.buildDepError "haskell-src-exts-util"))
          (hsPkgs."uniplate" or (errorHandler.buildDepError "uniplate"))
          (hsPkgs."haskell-src-meta" or (errorHandler.buildDepError "haskell-src-meta"))
          ] ++ (if flags.debug
          then [
            (hsPkgs."Hoed" or (errorHandler.buildDepError "Hoed"))
            (hsPkgs."haskell-src-exts-observe" or (errorHandler.buildDepError "haskell-src-exts-observe"))
            ]
          else [ (hsPkgs."NoHoed" or (errorHandler.buildDepError "NoHoed")) ]);
        buildable = true;
        };
      exes = {
        "arrowp" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."haskell-src-exts" or (errorHandler.buildDepError "haskell-src-exts"))
            (hsPkgs."arrowp-qq" or (errorHandler.buildDepError "arrowp-qq"))
            ] ++ (if flags.debug
            then [ (hsPkgs."Hoed" or (errorHandler.buildDepError "Hoed")) ]
            else [
              (hsPkgs."NoHoed" or (errorHandler.buildDepError "NoHoed"))
              ]);
          buildable = true;
          };
        };
      tests = {
        "examples" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."arrows" or (errorHandler.buildDepError "arrows"))
            (hsPkgs."arrowp-qq" or (errorHandler.buildDepError "arrowp-qq"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            ];
          buildable = if flags.testexamples then true else false;
          };
        };
      };
    }