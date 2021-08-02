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
      identifier = { name = "relational-schemas"; version = "0.1.8.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2013-2019 Kei Hibino, 2013 Shohei Murayama, 2013 Shohei Yasutake, 2013 Sho KURODA";
      maintainer = "ex8k.hibino@gmail.com, shohei.murayama@gmail.com, amutake.s@gmail.com, krdlab@gmail.com";
      author = "Kei Hibino, Shohei Murayama, Shohei Yasutake, Sho KURODA";
      homepage = "http://khibino.github.io/haskell-relational-record/";
      url = "";
      synopsis = "RDBMSs' schema templates for relational-query";
      description = "This package contains some RDBMSs' schema structure definitions.\n\nSupported RDBMS schemas are below:\n\n- IBM DB2\n- PostgreSQL\n- Microsoft SQLServer\n- SQLite3\n- Oracle\n- MySQL";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."sql-words" or (errorHandler.buildDepError "sql-words"))
          (hsPkgs."relational-query" or (errorHandler.buildDepError "relational-query"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && ((compiler.version).ge "7.4" && (compiler.version).lt "7.5")) (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"));
        buildable = true;
        };
      };
    }