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
      identifier = { name = "nix-deploy"; version = "1.0.4"; };
      license = "Apache-2.0";
      copyright = "2017 Awake Networks";
      maintainer = "opensource@awakenetworks.com";
      author = "Awake Networks";
      homepage = "https://github.com/awakesecurity/nix-deploy#readme";
      url = "";
      synopsis = "Deploy Nix-built software to a NixOS machine";
      description = "Deploy a NixOS system configuration with @nix-deploy system ...@ to\na remote machine and switch the machine to that system\nconfiguration. You can also deploy a nix store path with @nix-deploy\npath ...@ to a remote machine or from a remote machine.\n\nThis tool is often used in conjunction with <https://github.com/awakesecurity/nix-delegate nix-delegate>.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "nix-deploy" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."optparse-generic" or (errorHandler.buildDepError "optparse-generic"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."neat-interpolation" or (errorHandler.buildDepError "neat-interpolation"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."turtle" or (errorHandler.buildDepError "turtle"))
            ];
          buildable = true;
          };
        };
      };
    }