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
    flags = { splitbase = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "hoogle"; version = "3.1"; };
      license = "LicenseRef-GPL";
      copyright = "Neil Mitchell 2004-2008";
      maintainer = "Neil Mitchell <ndmitchell@gmail.com>";
      author = "Neil Mitchell <ndmitchell@gmail.com>";
      homepage = "http://www.haskell.org/hoogle/";
      url = "";
      synopsis = "Haskell API Search";
      description = "Hoogle is a Haskell API search engine, which allows you to\nsearch many standard Haskell libraries by either function name,\nor by approximate type signature.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hoogle" = {
          depends = if flags.splitbase
            then [
              (hsPkgs."base" or (errorHandler.buildDepError "base"))
              (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
              (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
              ]
            else [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
          buildable = true;
          };
        };
      };
    }