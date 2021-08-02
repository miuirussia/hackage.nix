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
    flags = { splitbase = true; bytestringinbase = false; };
    package = {
      specVersion = "1.2";
      identifier = { name = "HaXml"; version = "1.25"; };
      license = "LicenseRef-LGPL";
      copyright = "";
      maintainer = "author";
      author = "Malcolm Wallace <Malcolm.Wallace@me.com>";
      homepage = "http://projects.haskell.org/HaXml/";
      url = "";
      synopsis = "Utilities for manipulating XML documents";
      description = "Haskell utilities for parsing, filtering, transforming and\ngenerating XML documents.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."polyparse" or (errorHandler.buildDepError "polyparse"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          ] ++ (if flags.splitbase
          then [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            ]
          else [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            ])) ++ (if flags.bytestringinbase
          then [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]
          else [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            ]);
        buildable = true;
        };
      exes = {
        "Canonicalise" = { buildable = true; };
        "CanonicaliseLazy" = { buildable = true; };
        "Xtract" = { buildable = true; };
        "Validate" = { buildable = true; };
        "MkOneOf" = { buildable = true; };
        "DtdToHaskell" = { buildable = true; };
        "XsdToHaskell" = { buildable = true; };
        "FpMLToHaskell" = {
          depends = [
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            ];
          buildable = true;
          };
        };
      };
    }