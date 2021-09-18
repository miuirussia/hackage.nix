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
      identifier = { name = "portray"; version = "0.2.0"; };
      license = "Apache-2.0";
      copyright = "2020-2021 Google LLC";
      maintainer = "Andrew Pritchard <awpr@google.com>";
      author = "Andrew Pritchard <awpr@google.com>";
      homepage = "https://github.com/google/hs-portray#readme";
      url = "";
      synopsis = "A pseudo-Haskell syntax type and typeclass producing it.";
      description = "This provides a single place to describe how a type should be formatted as\npseudo-Haskell syntax, independently of the actual pretty-printing library\n(e.g. \"pretty\", \"ansi-wl-pprint\", or \"prettyprinter\") that will ultimately be\nused to render it.  This means packages can cheaply provide integration with\nall pretty-printers by providing an instance of this class, without needing\nto depend on any of them (or their layout algorithms).\n\nOf course, this comes at the cost of targeting a predeclared set of\nformatting choices.  If there are any egregious omissions, we can always add\nmore constructors.\n\nThis library is explicitly not intended to provide a way to express /all\ndocuments/; only a particular flavor of pseudo-Haskell syntax representing\nvalues and types.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."wrapped" or (errorHandler.buildDepError "wrapped"))
          ];
        buildable = true;
        };
      tests = {
        "Portray-test" = {
          depends = [
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."portray" or (errorHandler.buildDepError "portray"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."wrapped" or (errorHandler.buildDepError "wrapped"))
            ];
          buildable = true;
          };
        };
      };
    }