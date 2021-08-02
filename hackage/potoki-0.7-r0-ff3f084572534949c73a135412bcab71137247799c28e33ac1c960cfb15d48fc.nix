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
      specVersion = "1.10";
      identifier = { name = "potoki"; version = "0.7"; };
      license = "MIT";
      copyright = "(c) 2017, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/potoki ";
      url = "";
      synopsis = "Simple streaming in IO";
      description = "This library provides a new simpler approach to the IO-streaming problem.\n\nIn difference to libraries like \\\"pipes\\\", \\\"conduit\\\", \\\"streaming\\\",\nthis library is specialised to streaming in the IO monad,\nwhich greatly simplifies the abstractions that it provides.\nThis simplification is motivated by the fact that the majority of streaming\ntasks are performed in IO anyway.\n\nAlso, unlike the mentioned libraries,\n\\\"potoki\\\" API doesn't treat streaming as a side operation in its abstractions,\nwhich allows it to express the composition of streams using the standard\ntypeclass instances, thus simplifying the API even further.\n\nNaturally, being simpler limits the application area of this library.\nThus it is not capable of transforming custom context monads and etc.\nIt is a tradeoff, but, as we expect, the user will rarely be affected by it.\n\nAnother benefit of being specialized to IO is the ability to optimize for performance better.\nIt must however be mentioned that this is only theoretical and no benchmarks have yet been performed.\n\nIn some of the mentioned regards \\\"potoki\\\" is similar to the \\\"io-streams\\\" library.\nHowever, unlike that library it approaches composition with the standard typeclass instances.\nAlso, in difference to \\\"io-streams\\\", \\\"potoki\\\" doesn't use exceptions for control-flow.\nIn fact, \\\"potoki\\\" doesn't use exceptions whatsoever,\ninstead it makes failures explicit, using the standard @Either@ type.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base-prelude" or (errorHandler.buildDepError "base-prelude"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."foldl" or (errorHandler.buildDepError "foldl"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."potoki-core" or (errorHandler.buildDepError "potoki-core"))
          (hsPkgs."profunctors" or (errorHandler.buildDepError "profunctors"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."unagi-chan" or (errorHandler.buildDepError "unagi-chan"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
            (hsPkgs."potoki" or (errorHandler.buildDepError "potoki"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (errorHandler.buildDepError "quickcheck-instances"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."rerebase" or (errorHandler.buildDepError "rerebase"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            ];
          buildable = true;
          };
        };
      };
    }