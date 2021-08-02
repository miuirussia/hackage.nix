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
      identifier = { name = "starling"; version = "0.1.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Antoine Latter <aslatter@gmail.com>";
      author = "Antoine Latter <aslatter@gmail.com>";
      homepage = "http://community.haskell.org/~aslatter/code/starling";
      url = "";
      synopsis = "A memcached client";
      description = "A haskell memcached client. See http:\\/\\/memcached.org\nfor more information.\n\nThis implements the new binary protocol,\nso it only works with memcached version\n1.3 and newer.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        buildable = true;
        };
      };
    }