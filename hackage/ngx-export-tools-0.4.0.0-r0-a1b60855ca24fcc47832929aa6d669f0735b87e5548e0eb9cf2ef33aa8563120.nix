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
      specVersion = "1.8";
      identifier = { name = "ngx-export-tools"; version = "0.4.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2018 Alexey Radkov";
      maintainer = "Alexey Radkov <alexey.radkov@gmail.com>";
      author = "Alexey Radkov <alexey.radkov@gmail.com>";
      homepage = "http://github.com/lyokha/nginx-haskell-module";
      url = "";
      synopsis = "Extra tools for Nginx haskell module";
      description = "Extra tools for\n<http://github.com/lyokha/nginx-haskell-module Nginx haskell module>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."ngx-export" or (errorHandler.buildDepError "ngx-export"))
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."safe" or (errorHandler.buildDepError "safe"))
          ];
        buildable = true;
        };
      };
    }