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
    flags = { nix-2_4 = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "hercules-ci-cnix-store"; version = "0.2.0.0"; };
      license = "Apache-2.0";
      copyright = "2018-2020 Hercules CI";
      maintainer = "info@hercules-ci.com";
      author = "Hercules CI contributors";
      homepage = "https://docs.hercules-ci.com";
      url = "";
      synopsis = "Haskell bindings for Nix's libstore";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."inline-c" or (errorHandler.buildDepError "inline-c"))
          (hsPkgs."inline-c-cpp" or (errorHandler.buildDepError "inline-c-cpp"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."protolude" or (errorHandler.buildDepError "protolude"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."unliftio-core" or (errorHandler.buildDepError "unliftio-core"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
        libs = [
          (pkgs."stdc++" or (errorHandler.sysDepError "stdc++"))
          (pkgs."boost_context" or (errorHandler.sysDepError "boost_context"))
          ];
        pkgconfig = [
          (pkgconfPkgs."nix-store" or (errorHandler.pkgConfDepError "nix-store"))
          (pkgconfPkgs."nix-main" or (errorHandler.pkgConfDepError "nix-main"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
            (hsPkgs."hercules-ci-cnix-store" or (errorHandler.buildDepError "hercules-ci-cnix-store"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."inline-c" or (errorHandler.buildDepError "inline-c"))
            (hsPkgs."inline-c-cpp" or (errorHandler.buildDepError "inline-c-cpp"))
            (hsPkgs."protolude" or (errorHandler.buildDepError "protolude"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover.components.exes.hspec-discover or (pkgs.buildPackages.hspec-discover or (errorHandler.buildToolDepError "hspec-discover:hspec-discover")))
            ];
          buildable = true;
          };
        };
      };
    }