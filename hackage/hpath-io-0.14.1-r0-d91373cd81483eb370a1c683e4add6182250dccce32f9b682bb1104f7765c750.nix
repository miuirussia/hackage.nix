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
      identifier = { name = "hpath-io"; version = "0.14.1"; };
      license = "BSD-3-Clause";
      copyright = "Julian Ospald 2016";
      maintainer = "Julian Ospald <hasufell@posteo.de>";
      author = "Julian Ospald <hasufell@posteo.de>";
      homepage = "";
      url = "";
      synopsis = "High-level IO operations on files/directories";
      description = "High-level IO operations on files/directories, utilizing type-safe Paths";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."hpath" or (errorHandler.buildDepError "hpath"))
          (hsPkgs."hpath-directory" or (errorHandler.buildDepError "hpath-directory"))
          (hsPkgs."hpath-posix" or (errorHandler.buildDepError "hpath-posix"))
          (hsPkgs."safe-exceptions" or (errorHandler.buildDepError "safe-exceptions"))
          (hsPkgs."streamly" or (errorHandler.buildDepError "streamly"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          ] ++ (pkgs.lib).optional (system.isWindows) (hsPkgs."unbuildable" or (errorHandler.buildDepError "unbuildable"))) ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "7.11")) (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"));
        buildable = if system.isWindows then false else true;
        };
      };
    }