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
      identifier = { name = "odpic-raw"; version = "0.3.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Daniel YU <leptonyu@gmail.com>";
      author = "";
      homepage = "https://github.com/leptonyu/odpic-raw#readme";
      url = "";
      synopsis = "Oracle Database Bindings";
      description = "A low-level client library for the Oracle database, implemented as bindings to the C ODPI API.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."Decimal" or (errorHandler.buildDepError "Decimal"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
        libs = [ (pkgs."odpic" or (errorHandler.sysDepError "odpic")) ];
        build-tools = [
          (hsPkgs.buildPackages.c2hs.components.exes.c2hs or (pkgs.buildPackages.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")))
          ];
        buildable = true;
        };
      tests = {
        "odpic-raw-test" = {
          depends = [
            (hsPkgs."Decimal" or (errorHandler.buildDepError "Decimal"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."odpic-raw" or (errorHandler.buildDepError "odpic-raw"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            ];
          buildable = true;
          };
        };
      };
    }