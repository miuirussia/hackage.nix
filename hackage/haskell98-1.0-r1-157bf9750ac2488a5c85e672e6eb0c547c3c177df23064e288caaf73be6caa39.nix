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
      identifier = { name = "haskell98"; version = "1.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "libraries@haskell.org";
      author = "";
      homepage = "http://www.haskell.org/definition/";
      url = "";
      synopsis = "Compatibility with Haskell 98";
      description = "This package provides compatibility with the modules of Haskell\n98 and the FFI addendum, by means of wrappers around modules from\nthe base package (which in many cases have additional features).\nHowever Prelude, Numeric and Foreign are provided directly by\nthe base package.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      };
    }