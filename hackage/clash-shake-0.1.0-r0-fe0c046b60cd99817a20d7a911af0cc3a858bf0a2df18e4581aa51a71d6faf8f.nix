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
      specVersion = "1.12";
      identifier = { name = "clash-shake"; version = "0.1.0"; };
      license = "MIT";
      copyright = "2021 Gergő Érdi";
      maintainer = "gergo@erdi.hu";
      author = "Gergő Érdi";
      homepage = "https://github.com/gergoerdi/clash-shake#readme";
      url = "";
      synopsis = "Shake rules for building Clash programs";
      description = "Shake rules for building Clash programs and synthesizing FPGA\nconfiguration. Contains build rules for Xilinx ISE and Xilinx Vivado\ntoolchains. See <https://github.com/gergoerdi/clash-pong/> for an\nexample project.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."clash-ghc" or (errorHandler.buildDepError "clash-ghc"))
          (hsPkgs."clash-lib" or (errorHandler.buildDepError "clash-lib"))
          (hsPkgs."clash-prelude" or (errorHandler.buildDepError "clash-prelude"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."ghc-typelits-extra" or (errorHandler.buildDepError "ghc-typelits-extra"))
          (hsPkgs."ghc-typelits-knownnat" or (errorHandler.buildDepError "ghc-typelits-knownnat"))
          (hsPkgs."ghc-typelits-natnormalise" or (errorHandler.buildDepError "ghc-typelits-natnormalise"))
          (hsPkgs."shake" or (errorHandler.buildDepError "shake"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."stache" or (errorHandler.buildDepError "stache"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
        buildable = true;
        };
      };
    }