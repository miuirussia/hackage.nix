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
      identifier = { name = "managed"; version = "1.0.6"; };
      license = "BSD-3-Clause";
      copyright = "2014 Gabriel Gonzalez";
      maintainer = "Gabriel439@gmail.com";
      author = "Gabriel Gonzalez";
      homepage = "";
      url = "";
      synopsis = "A monad for managed values";
      description = "In Haskell you very often acquire values using the @with...@\nidiom using functions of type @(a -> IO r) -> IO r@.  This idiom forms a\n@Monad@, which is a special case of the @ContT@ monad (from @transformers@) or\nthe @Codensity@ monad (from @kan-extensions@).  The main purpose behind this\npackage is to provide a restricted form of these monads specialized to this\nunusually common case.\n\nThe reason this package defines a specialized version of these types is to:\n\n* be more beginner-friendly,\n\n* simplify inferred types and error messages, and:\n\n* provide some additional type class instances that would otherwise be orphan\ninstances";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.0")) (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"));
        buildable = true;
        };
      };
    }