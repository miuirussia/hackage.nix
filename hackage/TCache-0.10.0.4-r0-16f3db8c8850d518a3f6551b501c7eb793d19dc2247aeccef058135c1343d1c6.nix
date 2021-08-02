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
      identifier = { name = "TCache"; version = "0.10.0.4"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "agocorona@gmail.com";
      author = "Alberto Gómez Corona";
      homepage = "";
      url = "";
      synopsis = "A Transactional cache with user-defined persistence";
      description = "TCache is a transactional cache with configurable persitence. It allows conventional\nSTM transactions for objects that syncronize  with\ntheir user defined storages.\nState in memory and into permanent storage is transactionally coherent.\n\nThe package implements serializable STM references, access by key and by record field value, triggers,\nfull text and field indexation, default serialization and a query language based on record fields\n\nThis version add memoization and a persistent and transactional collection/queue\n\nSee \"Data.TCache\" for details";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."RefSerialize" or (errorHandler.buildDepError "RefSerialize"))
          ];
        buildable = true;
        };
      };
    }