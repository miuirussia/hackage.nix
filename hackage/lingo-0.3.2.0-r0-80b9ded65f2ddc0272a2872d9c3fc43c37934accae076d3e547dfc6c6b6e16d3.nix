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
      specVersion = "2.4";
      identifier = { name = "lingo"; version = "0.3.2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "timothy.clem@gmail.com";
      author = "Timothy Clem";
      homepage = "https://github.com/tclem/lingo-haskell";
      url = "";
      synopsis = "File extension based programming language detection";
      description = "Lingo uses github/linguist's language registry to enable fast detection of a file path's programming langauge based on extension or filename.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.buildPackages.Cabal or (pkgs.buildPackages.Cabal or (errorHandler.setupDepError "Cabal")))
        (hsPkgs.buildPackages.base or (pkgs.buildPackages.base or (errorHandler.setupDepError "base")))
        (hsPkgs.buildPackages.bytestring or (pkgs.buildPackages.bytestring or (errorHandler.setupDepError "bytestring")))
        (hsPkgs.buildPackages.containers or (pkgs.buildPackages.containers or (errorHandler.setupDepError "containers")))
        (hsPkgs.buildPackages.directory or (pkgs.buildPackages.directory or (errorHandler.setupDepError "directory")))
        (hsPkgs.buildPackages.filepath or (pkgs.buildPackages.filepath or (errorHandler.setupDepError "filepath")))
        (hsPkgs.buildPackages.text or (pkgs.buildPackages.text or (errorHandler.setupDepError "text")))
        (hsPkgs.buildPackages.yaml or (pkgs.buildPackages.yaml or (errorHandler.setupDepError "yaml")))
        ];
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."raw-strings-qq" or (errorHandler.buildDepError "raw-strings-qq"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."lingo" or (errorHandler.buildDepError "lingo"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            ];
          buildable = true;
          };
        };
      };
    }