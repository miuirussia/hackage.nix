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
    flags = { opencv23 = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "CV"; version = "0.3.5.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "ville.tirronen@jyu.fi";
      author = "Ville Tirronen";
      homepage = "http://aleator.github.com/CV/";
      url = "";
      synopsis = "OpenCV based machine vision library";
      description = "This is a machine vision package that wraps some functionality\nof OpenCV library. This package has been developed for personal use and\nis not meant to be a complete wrapper. It also includes some things not\nin OpenCV.\n\nCurrently this package is quite dirty and requires much work on documentation\nand code clean-up, but is somewhat tested.\n\n(The scarce) Documentation is available at\n<http://aleator.github.com/CV/>\n\nChangelog.\n0.3.5 - Many new wrappers, clean ups and other fixes.\n\n0.3.4 - Pixelwise operations, bug fixes and additional documentation\n\n0.3.3.0 - Improvements, including compatablity with opencv 2.3.1 and removal of\ndependency with deprecated JYU.Utils\n\nChangelog.\n0.3.2.0 - Improvements, including fancier pixel-wise manipulations\n\nChangelog.\n0.3.0.2 - Workaround for compiling with OS X 10.6 & fixed errors about M_PI\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."parallel" or (errorHandler.buildDepError "parallel"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."carray" or (errorHandler.buildDepError "carray"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."storable-complex" or (errorHandler.buildDepError "storable-complex"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."bindings-DSL" or (errorHandler.buildDepError "bindings-DSL"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."lazysmallcheck" or (errorHandler.buildDepError "lazysmallcheck"))
          (hsPkgs."storable-tuple" or (errorHandler.buildDepError "storable-tuple"))
          ];
        libs = [
          (pkgs."opencv_calib3d" or (errorHandler.sysDepError "opencv_calib3d"))
          (pkgs."opencv_contrib" or (errorHandler.sysDepError "opencv_contrib"))
          (pkgs."opencv_core" or (errorHandler.sysDepError "opencv_core"))
          (pkgs."opencv_features2d" or (errorHandler.sysDepError "opencv_features2d"))
          (pkgs."opencv_flann" or (errorHandler.sysDepError "opencv_flann"))
          (pkgs."opencv_gpu" or (errorHandler.sysDepError "opencv_gpu"))
          (pkgs."opencv_highgui" or (errorHandler.sysDepError "opencv_highgui"))
          (pkgs."opencv_imgproc" or (errorHandler.sysDepError "opencv_imgproc"))
          (pkgs."opencv_legacy" or (errorHandler.sysDepError "opencv_legacy"))
          (pkgs."opencv_ml" or (errorHandler.sysDepError "opencv_ml"))
          (pkgs."opencv_objdetect" or (errorHandler.sysDepError "opencv_objdetect"))
          (pkgs."opencv_video" or (errorHandler.sysDepError "opencv_video"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.c2hs.components.exes.c2hs or (pkgs.buildPackages.c2hs or (errorHandler.buildToolDepError "c2hs:c2hs")))
          ];
        buildable = true;
        };
      };
    }