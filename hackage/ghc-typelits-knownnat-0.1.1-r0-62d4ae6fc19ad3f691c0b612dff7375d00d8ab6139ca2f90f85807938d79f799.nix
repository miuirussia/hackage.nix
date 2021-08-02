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
    flags = { deverror = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "ghc-typelits-knownnat"; version = "0.1.1"; };
      license = "BSD-2-Clause";
      copyright = "Copyright © 2016 University of Twente";
      maintainer = "christiaan.baaij@gmail.com";
      author = "Christiaan Baaij";
      homepage = "http://clash-lang.org/";
      url = "";
      synopsis = "Derive KnownNat constraints from other KnownNat constraints";
      description = "A type checker plugin for GHC that can derive \\\"complex\\\" @KnownNat@\nconstraints from other simple/variable @KnownNat@ constraints. i.e. without\nthis plugin, you must have both a @KnownNat n@ and a @KnownNat (n+2)@\nconstraint in the type signature of the following function:\n\n@\nf :: forall n . (KnownNat n, KnownNat (n+2)) => Proxy n -> Integer\nf _ = natVal (Proxy :: Proxy n) + natVal (Proxy :: Proxy (n+2))\n@\n\nUsing the plugin you can omit the @KnownNat (n+2)@ constraint:\n\n@\nf :: forall n . KnownNat n => Proxy n -> Integer\nf _ = natVal (Proxy :: Proxy n) + natVal (Proxy :: Proxy (n+2))\n@\n\nThe plugin can only derive @KnownNat@ constraints consisting of:\n\n* Type-level naturals\n\n* Type variables\n\n* Applications of the arithmetic expression: +,*,^\n\ni.e. it /cannot/ derive a @KnownNat (n-1)@ constraint from a @KnownNat n@\nconstraint\n\nTo use the plugin, add the\n\n@\nOPTIONS_GHC -fplugin GHC.TypeLits.KnownNat.Solver\n@\n\nPragma to the header of your file.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."ghc-tcplugins-extra" or (errorHandler.buildDepError "ghc-tcplugins-extra"))
          ];
        buildable = true;
        };
      tests = {
        "test-ghc-typelits-knownat" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."ghc-typelits-knownnat" or (errorHandler.buildDepError "ghc-typelits-knownnat"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            ];
          buildable = true;
          };
        };
      };
    }