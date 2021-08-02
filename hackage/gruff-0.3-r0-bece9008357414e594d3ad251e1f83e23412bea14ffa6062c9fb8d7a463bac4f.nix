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
    flags = { mpfr = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "gruff"; version = "0.3"; };
      license = "GPL-2.0-only";
      copyright = "";
      maintainer = "claudiusmaximus@goto10.org";
      author = "Claude Heiland-Allen";
      homepage = "";
      url = "";
      synopsis = "fractal explorer GUI using the ruff library";
      description = "Mandelbrot Set fractal explorer using the ruff library.\n\nRequires GTK, OpenGL, and GLSL fragment shader support; lots of RAM\nand multiple CPU cores recommended.  If you want to explore very deep\nzooms, you'll need hmpfr which currently requires GHC to be compiled\nwith integer-simple instead of the default integer-gmp.  To install\nwith MPFR support, use @cabal install gruff -fmpfr@.  (Note that the\ndefault setting for this flag has changed since the previous release.)\n\ngruff-0.3 includes a small library to allow external programs to\ncreate diagrams and animations with gruff.  See the gruff-examples\npackage.  The interface has been remodelled to simplify it and add\ninformative feature overlays.\n\ngruff-0.2.1 was a bugfix release.  Changes since gruff-0.2:\n\n* Supersampling bugs are fixed (no more undocumented quantization\nleading to inconsistent appearance at different zoom levels).\n\n* Race condition bugs in cache management are fixed (no more\nincompletely rendered images).\n\n* Internal changes/refactoring to make future additions easier.\n\nFeatures in this version include:\n\n* Interactive fractal browser display with mouse controls:\n\n* Left click to zoom in (press shift for bigger jumps).\n\n* Right click to zoom out (press shift for bigger jumps).\n\n* Middle click to center.\n\n* Shift middle click to auto-focus.\n\n* Control left click to label with period.\n\n* Control right click to label with angled internal address (slow!).\n\n* Session persistance (stored in @~\\/.gruff\\/state.gruff@ - states can\nalso be loaded from and saved to other files, including labels and\nrays).  Note that the file format is incompatible with previous\nreleases of gruff.\n\n* Tile cache (by default in @~\\/.gruff\\/cache@ - symlink it somewhere\nwith a few GB of space if you plan on exploring a lot).\n\n* Can use MPFR if desired for higher precision, allowing deeper\nzooms and locating high period nucleii.\n\n* Limited amount of customizable colouring (colours for interior,\nborder, and exterior points, as well as labels and rays).\n\n* Supersampling for more detailed images (useful range is 1 to 16).\n\n* Rudimentary scripting support (see the gruff-examples package).\n\nFuture versions will focus on enhancing the scripting support.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."ruff" or (errorHandler.buildDepError "ruff"))
          ];
        buildable = true;
        };
      exes = {
        "gruff" = {
          depends = [
            (hsPkgs."gruff" or (errorHandler.buildDepError "gruff"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."FTGL" or (errorHandler.buildDepError "FTGL"))
            (hsPkgs."gtk" or (errorHandler.buildDepError "gtk"))
            (hsPkgs."gtkglext" or (errorHandler.buildDepError "gtkglext"))
            (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
            (hsPkgs."OpenGL" or (errorHandler.buildDepError "OpenGL"))
            (hsPkgs."OpenGLRaw" or (errorHandler.buildDepError "OpenGLRaw"))
            (hsPkgs."parallel" or (errorHandler.buildDepError "parallel"))
            (hsPkgs."qd" or (errorHandler.buildDepError "qd"))
            (hsPkgs."qd-vec" or (errorHandler.buildDepError "qd-vec"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."Vec" or (errorHandler.buildDepError "Vec"))
            (hsPkgs."ruff" or (errorHandler.buildDepError "ruff"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            ] ++ (pkgs.lib).optional (flags.mpfr) (hsPkgs."hmpfr" or (errorHandler.buildDepError "hmpfr"));
          buildable = true;
          };
        };
      };
    }