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
    flags = { cgi = true; test = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "texmath"; version = "0.2.0.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "jgm@berkeley.edu";
      author = "John MacFarlane";
      homepage = "http://github.com/jgm/texmath";
      url = "";
      synopsis = "Conversion of LaTeX math formulas to MathML.";
      description = "The texmathml library provides functions to convert LaTeX\nmath formulas to presentation MathML. It supports\nbasic LaTeX and AMS extensions, but not macros.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."xml" or (errorHandler.buildDepError "xml"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          ] ++ (if compiler.isGhc && (compiler.version).ge "6.10"
          then [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            ]
          else [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]);
        buildable = true;
        };
      exes = {
        "testTeXMathML" = { buildable = if flags.test then true else false; };
        "texmath-cgi" = {
          depends = [
            (hsPkgs."cgi" or (errorHandler.buildDepError "cgi"))
            (hsPkgs."json" or (errorHandler.buildDepError "json"))
            ];
          buildable = if flags.cgi then true else false;
          };
        };
      };
    }