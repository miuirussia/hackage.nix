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
    flags = { small_base = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "JSON-Combinator"; version = "0.2.8"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Tony Morris";
      author = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ>";
      homepage = "";
      url = "";
      synopsis = "A combinator library on top of a generalised JSON type";
      description = "A combinator library on top of a generalised JSON type. The highest-level module is\n@Text.JSON.Combinator@ and it is expected that no other module need to be explicitly imported.\n\nInstances for the combinators are provided for four libraries available on hackage:\n\n* json (@Text.JSON@)\n\n* JSONb (@Text.JSONb@)\n\n* hjson (@Text.HJson@)\n\n* aeson (@Data.Aeson@)";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."JSONb" or (errorHandler.buildDepError "JSONb"))
          (hsPkgs."json" or (errorHandler.buildDepError "json"))
          (hsPkgs."hjson" or (errorHandler.buildDepError "hjson"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."bytestring-trie" or (errorHandler.buildDepError "bytestring-trie"))
          (hsPkgs."failure" or (errorHandler.buildDepError "failure"))
          ];
        buildable = true;
        };
      };
    }