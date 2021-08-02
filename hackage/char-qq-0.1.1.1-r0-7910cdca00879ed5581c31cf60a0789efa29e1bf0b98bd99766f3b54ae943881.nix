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
      identifier = { name = "char-qq"; version = "0.1.1.1"; };
      license = "MIT";
      copyright = "(c) 2019 Metrix.AI";
      maintainer = "Metrix.AI Tech Team <tech@metrix.ai>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/metrix-ai/char-qq";
      url = "";
      synopsis = "Quasiquoters for characters and codepoints";
      description = "A set of quasiquoters providing compile-time conversions between characters and codepoints.\n\nSolves such problems as when you'd rather refer to a codepoint by a char,\nbut don't want to waste your runtime computation cycles on the \"ord\" operation.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          ];
        buildable = true;
        };
      };
    }