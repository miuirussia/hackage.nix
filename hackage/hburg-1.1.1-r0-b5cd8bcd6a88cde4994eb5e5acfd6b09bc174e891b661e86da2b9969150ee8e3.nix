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
    flags = { small_base = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "hburg"; version = "1.1.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "igor@bytelabs.org";
      author = "Igor Boehm <igor@bytelabs.org>";
      homepage = "http://www.bytelabs.org/hburg.html";
      url = "";
      synopsis = "Haskell Bottom Up Rewrite Generator";
      description = "HBURG is a program that generates tree parsers for cost-augmented\ntree grammars. It is useful for writing code generators for compilers.\nGiven a mapping of a tree structured intermediate representation onto\ntarget machine instructions, HBURG generates a code generator that can\nbe plugged into the instruction selection phase of a compiler. For more\ninformation see \"http://www.bytelabs.org/pub/papers/hburg07.pdf\".";
      buildType = "Custom";
      };
    components = {
      exes = {
        "hburg" = {
          depends = [
            (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            ] ++ (if flags.small_base
            then [
              (hsPkgs."base" or (errorHandler.buildDepError "base"))
              (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
              (hsPkgs."array" or (errorHandler.buildDepError "array"))
              ]
            else [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]);
          buildable = true;
          };
        };
      };
    }