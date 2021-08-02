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
      identifier = { name = "binding-core"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "haskell@accursoft.org";
      author = "Gideon Sireling";
      homepage = "https://github.com/accursoft/binding";
      url = "";
      synopsis = "Data Binding";
      description = "Bind mutable data and lists to IO objects.\nWrappers for binding to graphical widgets are provided by binding-gtk and binding-wx.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          ];
        buildable = true;
        };
      tests = {
        "hunit" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."binding-core" or (errorHandler.buildDepError "binding-core"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            ];
          buildable = true;
          };
        "quickcheck" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."binding-core" or (errorHandler.buildDepError "binding-core"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }