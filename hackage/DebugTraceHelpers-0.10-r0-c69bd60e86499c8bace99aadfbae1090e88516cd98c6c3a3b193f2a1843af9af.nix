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
      specVersion = "1.0";
      identifier = { name = "DebugTraceHelpers"; version = "0.10"; };
      license = "LicenseRef-GPL";
      copyright = "Copyright (c) 2008 Thomas Hartman";
      maintainer = "Thomas Hartman <thomashartman1 at gmail>";
      author = "Thomas Hartman";
      homepage = "";
      url = "";
      synopsis = "Convenience functions and instances for Debug.Trace";
      description = "Convenience functions and instances for tracing, based on Debug.Trace. ";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ];
        buildable = true;
        };
      };
    }