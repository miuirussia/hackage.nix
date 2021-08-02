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
      specVersion = "1.6";
      identifier = { name = "templatepg"; version = "0.2.7"; };
      license = "MIT";
      copyright = "2010, 2011, 2012, 2013, 2015 Chris Forno";
      maintainer = "jekor@jekor.com";
      author = "Chris Forno (jekor)";
      homepage = "https://github.com/jekor/templatepg";
      url = "https://github.com/jekor/templatepg/archive/master.tar.gz";
      synopsis = "A PostgreSQL access library with compile-time SQL type inference";
      description = "TemplatePG provides PostgreSQL access from Haskell via the\nPostgreSQL protocol. It also provides a higher-level Template\nHaskell interface. It eliminates a class of runtime errors by\nchecking queries against a PostgreSQL database at compile-time.\nThis also reduces boilerplate code for dealing with query\nresults, as the type and number of result columns are known at\ncompile-time.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."haskell-src-meta" or (errorHandler.buildDepError "haskell-src-meta"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."regex-compat" or (errorHandler.buildDepError "regex-compat"))
          (hsPkgs."regex-posix" or (errorHandler.buildDepError "regex-posix"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          ];
        buildable = true;
        };
      };
    }