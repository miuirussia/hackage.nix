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
    flags = { test-cabal114 = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "text-ldap"; version = "0.1.1.3"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2014 Kei Hibino";
      maintainer = "ex8k.hibino@gmail.com";
      author = "Kei Hibino";
      homepage = "";
      url = "";
      synopsis = "Parser and Printer for LDAP text data stream";
      description = "This package contains Parser and Printer for\nLDAP text data stream like OpenLDAP backup LDIF.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."base64-bytestring" or (errorHandler.buildDepError "base64-bytestring"))
          ];
        buildable = true;
        };
      exes = {
        "parseTest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text-ldap" or (errorHandler.buildDepError "text-ldap"))
            ];
          buildable = true;
          };
        "ppTest" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."text-ldap" or (errorHandler.buildDepError "text-ldap"))
            ];
          buildable = true;
          };
        };
      tests = {
        "pp" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
            (hsPkgs."text-ldap" or (errorHandler.buildDepError "text-ldap"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            ];
          buildable = true;
          };
        };
      };
    }