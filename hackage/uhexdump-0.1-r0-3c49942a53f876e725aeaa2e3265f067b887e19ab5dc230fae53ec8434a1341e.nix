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
      specVersion = "1.0";
      identifier = { name = "uhexdump"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "<E.Y.Kow@brighton.ac.uk>";
      author = "Eric Kow";
      homepage = "";
      url = "";
      synopsis = "hex dumper for UTF-8 text";
      description = "hex dumper for UTF-8 text";
      buildType = "Simple";
      };
    components = {
      exes = {
        "uhexdump" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
            ];
          buildable = true;
          };
        };
      };
    }