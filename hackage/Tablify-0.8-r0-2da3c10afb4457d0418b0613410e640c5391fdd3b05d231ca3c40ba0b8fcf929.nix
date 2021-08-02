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
      specVersion = "1.2";
      identifier = { name = "Tablify"; version = "0.8"; };
      license = "BSD-3-Clause";
      copyright = "© 2009-2011 Daniel Lyons";
      maintainer = "Daniel Lyons <fusion@storytotell.org>";
      author = "Daniel Lyons";
      homepage = "http://www.storytotell.org/code/tablify";
      url = "";
      synopsis = "Tool to render CSV into tables of various formats";
      description = "Tool to render CSV into tables of various formats, including HTML, tbl, and character art (both ASCII and Unicode)";
      buildType = "Simple";
      };
    components = {
      exes = {
        "tablify" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
            (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
            (hsPkgs."regex-compat" or (errorHandler.buildDepError "regex-compat"))
            (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
            (hsPkgs."xhtml" or (errorHandler.buildDepError "xhtml"))
            (hsPkgs."safer-file-handles" or (errorHandler.buildDepError "safer-file-handles"))
            ];
          buildable = true;
          };
        };
      };
    }