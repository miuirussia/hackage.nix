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
      specVersion = "2.0";
      identifier = { name = "kparams"; version = "0.1.0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "me@mcsau.cc";
      author = "Josh McSavaney";
      homepage = "";
      url = "";
      synopsis = "Extracts values from /proc/cmdline.";
      description = "Extracts values from @\\/proc\\/cmdline@, honoring quotes and @\\\\@ sequences.";
      buildType = "Simple";
      };
    components = {
      sublibs = {
        "internal" = {
          depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
          buildable = true;
          };
        };
      exes = {
        "kparams" = {
          depends = [
            (hsPkgs."kparams".components.sublibs.internal or (errorHandler.buildDepError "kparams:internal"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test-kparams" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."kparams".components.sublibs.internal or (errorHandler.buildDepError "kparams:internal"))
            ];
          buildable = true;
          };
        };
      };
    }