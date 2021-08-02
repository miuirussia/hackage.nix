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
    flags = { buildtests = false; splitbase = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "explicit-exception"; version = "0.1.10"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
      author = "Henning Thielemann <haskell@henning-thielemann.de>";
      homepage = "http://www.haskell.org/haskellwiki/Exception";
      url = "";
      synopsis = "Exceptions which are explicit in the type signature.";
      description = "Synchronous and Asynchronous exceptions which are explicit in the type signature.\nThe first ones are very similar to 'Either' and 'Control.Monad.Error.ErrorT'.\nThe second ones are used for 'System.IO.readFile' and 'System.IO.hGetContents'.\nThis package is a proposal for improved exception handling in Haskell.\nIt strictly separates between handling of\nexceptional situations (file not found, invalid user input,\nsee <http://www.haskell.org/haskellwiki/Exception>) and\n(programming) errors (division by zero, index out of range,\nsee <http://www.haskell.org/haskellwiki/Error>).\nHandling of the first one is called \\\"exception handling\\\",\nwhereas handling of errors is better known as \\\"debugging\\\".\n\nFor applications see the packages @midi@, @spreadsheet@, @http-monad@.\n\nAlthough I'm not happy with the identifier style of the Monad Transformer Library\n(partially intended for unqualified use)\nI have tried to adopt it for this library,\nin order to let Haskell programmers get accustomed easily to it.\n\nSee also: @unexceptionalio@";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          ] ++ (if compiler.isJhc && true
          then [
            (hsPkgs."applicative" or (errorHandler.buildDepError "applicative"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            ]
          else if flags.splitbase
            then [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ]
            else [
              (hsPkgs."special-functors" or (errorHandler.buildDepError "special-functors"))
              (hsPkgs."base" or (errorHandler.buildDepError "base"))
              ]);
        buildable = true;
        };
      exes = {
        "ee-tar" = {
          depends = (pkgs.lib).optionals (flags.buildtests) [
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."tar" or (errorHandler.buildDepError "tar"))
            ];
          buildable = if flags.buildtests then true else false;
          };
        "ee-test" = {
          depends = (pkgs.lib).optional (flags.buildtests) (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"));
          buildable = if flags.buildtests then true else false;
          };
        "ee-unzip" = { buildable = if !flags.buildtests then false else true; };
        "ee-writer" = {
          buildable = if !flags.buildtests then false else true;
          };
        };
      };
    }