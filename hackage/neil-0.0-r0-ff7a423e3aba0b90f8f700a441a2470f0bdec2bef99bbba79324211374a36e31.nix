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
    flags = { small = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "neil"; version = "0.0"; };
      license = "BSD-3-Clause";
      copyright = "Neil Mitchell 2010-2014";
      maintainer = "Neil Mitchell <ndmitchell@gmail.com>";
      author = "Neil Mitchell <ndmitchell@gmail.com>";
      homepage = "http://community.haskell.org/~ndm/";
      url = "";
      synopsis = "General tools for Neil";
      description = "General tools for Neil.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
          ];
        buildable = true;
        };
      exes = {
        "neil" = {
          depends = [
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."cmdargs" or (errorHandler.buildDepError "cmdargs"))
            ] ++ (pkgs.lib).optionals (!flags.small) [
            (hsPkgs."json" or (errorHandler.buildDepError "json"))
            (hsPkgs."GoogleChart" or (errorHandler.buildDepError "GoogleChart"))
            (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
            ];
          buildable = true;
          };
        };
      };
    }