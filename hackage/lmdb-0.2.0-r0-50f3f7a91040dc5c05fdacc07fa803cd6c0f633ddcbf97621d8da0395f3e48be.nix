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
      identifier = { name = "lmdb"; version = "0.2.0"; };
      license = "BSD-2-Clause";
      copyright = "(c) 2014 by David Barbour";
      maintainer = "dmbarbour@gmail.com";
      author = "David Barbour";
      homepage = "http://github.com/dmbarbour/haskell-lmdb";
      url = "";
      synopsis = "Lightning MDB bindings ";
      description = "LMDB is a read-optimized Berkeley DB replacement developed by Sysmas\nfor the OpenLDAP project. LMDB has impressive performance characteristics\nand a friendly BSD-style license.\n\nYou will need to install the lmdb development files to install this\nlibrary, e.g. `sudo apt-get install liblmdb-dev` works for Ubuntu 14.04\n\nAt the moment, only a raw, low-level interface to LMDB is supported.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
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