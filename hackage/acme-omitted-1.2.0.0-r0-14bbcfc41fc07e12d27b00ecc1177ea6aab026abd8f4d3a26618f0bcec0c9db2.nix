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
      identifier = { name = "acme-omitted"; version = "1.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2013 Joachim Fasting";
      maintainer = "joachim.fasting@gmail.com";
      author = "Joachim Fasting";
      homepage = "https://github.com/joachifm/acme-omitted#readme";
      url = "";
      synopsis = "Purely functional omitted content for Haskell";
      description = "Standard Haskell lacks the ability to express the notion of\n\\\"omitted content\\\", making it impossible to distinguish the truly\n\\\"undefined\\\" and the merely \\\"omitted\\\".\n\nacme-omitted provides a universal definition of \\\"omitted\\\",\nan alternative to 'Prelude.undefined', and functions to observe\nthe difference.\n\nThe library is standards-compliant, type-safe, and user-friendly.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      tests = {
        "specs" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."hspec-discover" or (errorHandler.buildDepError "hspec-discover"))
            ];
          buildable = true;
          };
        };
      };
    }