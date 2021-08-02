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
    flags = { split-base = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "system-uuid"; version = "1.4.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "system-uuid@solidsnack.be";
      author = "Jason Dusek";
      homepage = "http://github.com/solidsnack/system-uuid/";
      url = "";
      synopsis = "Bindings to system UUID functions.";
      description = "Bindings to the native UUID generator for a number of platforms. Please\ncontact the author if your platform is not supported.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          ] ++ [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        libs = (pkgs.lib).optional (system.isLinux) (pkgs."uuid" or (errorHandler.sysDepError "uuid")) ++ (pkgs.lib).optional (system.isWindows) (pkgs."rpcrt4" or (errorHandler.sysDepError "rpcrt4"));
        buildable = true;
        };
      exes = {
        "hooty" = {
          libs = (pkgs.lib).optional (system.isLinux) (pkgs."uuid" or (errorHandler.sysDepError "uuid")) ++ (pkgs.lib).optional (system.isWindows) (pkgs."rpcrt4" or (errorHandler.sysDepError "rpcrt4"));
          buildable = true;
          };
        };
      };
    }