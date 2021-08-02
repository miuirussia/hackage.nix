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
      identifier = { name = "equational-reasoning"; version = "0.2.0.6"; };
      license = "BSD-3-Clause";
      copyright = "(c) Hiromi ISHII 2013-2014";
      maintainer = "konn.jinro_at_gmail.com";
      author = "Hiromi ISHII";
      homepage = "";
      url = "";
      synopsis = "Proof assistant for Haskell using DataKinds & PolyKinds";
      description = "A simple convenient library to write equational / preorder proof as in Agda.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."void" or (errorHandler.buildDepError "void"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          ] ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).lt "7.8") [
          (hsPkgs."singletons" or (errorHandler.buildDepError "singletons"))
          (hsPkgs."tagged" or (errorHandler.buildDepError "tagged"))
          ]) ++ [
          (hsPkgs."singletons" or (errorHandler.buildDepError "singletons"))
          ];
        buildable = true;
        };
      };
    }