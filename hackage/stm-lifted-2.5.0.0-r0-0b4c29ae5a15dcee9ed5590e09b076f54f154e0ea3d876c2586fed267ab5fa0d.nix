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
      identifier = { name = "stm-lifted"; version = "2.5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2013-2019 Maksymilian Owsianny";
      maintainer = "Maksymilian.Owsianny@gmail.com";
      author = "Maksymilian Owsianny";
      homepage = "";
      url = "";
      synopsis = "Software Transactional Memory lifted to MonadIO";
      description = "A MonadIO version of <http://hackage.haskell.org/package/stm STM> library.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."stm" or (errorHandler.buildDepError "stm"))
          ];
        buildable = true;
        };
      };
    }