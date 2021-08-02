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
      identifier = { name = "pugs-hsregex"; version = "1.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Pugs project <http://www.pugscode.org/>";
      author = "John Meacham <john@repetae.net>";
      homepage = "http://repetae.net/john/computer/haskell/hsregex/";
      url = "";
      synopsis = "Haskell PCRE binding";
      description = "A binding to Perl's advanced regular expression library, PCRE, for Haskell programs;\nthis library is used by the Pugs interpreter/compiler.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = if flags.small_base
          then [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
            (hsPkgs."array" or (errorHandler.buildDepError "array"))
            ]
          else [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
            ];
        buildable = true;
        };
      };
    }