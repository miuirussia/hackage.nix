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
    flags = { usepkgconfig = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "hydra-hs"; version = "1.0.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "github@dustlab.com";
      author = "Marcel Ruegenberg";
      homepage = "https://github.com/mruegenberg/hydra-hs";
      url = "";
      synopsis = "Haskell binding to the Sixense SDK for the Razer Hydra";
      description = "Bindings to the Sixense SDK for the Razer Hydra.\nTo get started, get the SDK from Sixense (http://sixense.com/developers), install it, then install hydra.hs.\nThe install script that comes with the SDK might not always work.\nTo build hydra-hs, you need both sixense.h and libsixense.dylib in a location where they can be found (such as /usr/local/include and /usr/local/lib).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hmatrix" or (errorHandler.buildDepError "hmatrix"))
          ];
        libs = if !system.isX86_64
          then (pkgs.lib).optional (!flags.usepkgconfig) (pkgs."sixense" or (errorHandler.sysDepError "sixense"))
          else (pkgs.lib).optional (!flags.usepkgconfig) (pkgs."sixense_x64" or (errorHandler.sysDepError "sixense_x64"));
        pkgconfig = if !system.isX86_64
          then (pkgs.lib).optional (flags.usepkgconfig) (pkgconfPkgs."libsixense" or (errorHandler.pkgConfDepError "libsixense"))
          else (pkgs.lib).optional (flags.usepkgconfig) (pkgconfPkgs."libsixense_x64" or (errorHandler.pkgConfDepError "libsixense_x64"));
        buildable = true;
        };
      tests = {
        "hydra-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hydra-hs" or (errorHandler.buildDepError "hydra-hs"))
            ];
          buildable = true;
          };
        };
      };
    }