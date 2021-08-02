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
      identifier = { name = "lmdb"; version = "0.2.1"; };
      license = "BSD-2-Clause";
      copyright = "(c) 2014 by David Barbour";
      maintainer = "dmbarbour@gmail.com";
      author = "David Barbour";
      homepage = "http://github.com/dmbarbour/haskell-lmdb";
      url = "";
      synopsis = "Lightning MDB bindings ";
      description = "LMDB is a read-optimized Berkeley DB replacement developed by Symas\nfor the OpenLDAP project. LMDB has impressive performance characteristics\nand a friendly BSD-style Open LDAP license. See <http://symas.com/mdb/>.\n\nThis library has Haskell bindings to the LMDB library. You must install\nthe lmdb development files before installing this library,\ne.g. `sudo apt-get install liblmdb-dev` works for Ubuntu 14.04.\n\nFor now, only a low level interface is provided, and the author is moving\non to use LMDB rather than further develop its bindings. If a higher level\nAPI is desired, please consider contributing, or develop a separate package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          ];
        libs = [ (pkgs."lmdb" or (errorHandler.sysDepError "lmdb")) ];
        build-tools = [
          (hsPkgs.buildPackages.hsc2hs.components.exes.hsc2hs or (pkgs.buildPackages.hsc2hs or (errorHandler.buildToolDepError "hsc2hs:hsc2hs")))
          ];
        buildable = true;
        };
      };
    }