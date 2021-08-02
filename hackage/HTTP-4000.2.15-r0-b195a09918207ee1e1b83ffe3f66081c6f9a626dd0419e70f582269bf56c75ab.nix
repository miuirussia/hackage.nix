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
    flags = {
      mtl1 = false;
      warn-as-error = false;
      network23 = false;
      conduit10 = false;
      };
    package = {
      specVersion = "1.8";
      identifier = { name = "HTTP"; version = "4000.2.15"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Ganesh Sittampalam <http@projects.haskell.org>";
      author = "Warrick Gray <warrick.gray@hotmail.com>";
      homepage = "https://github.com/haskell/HTTP";
      url = "";
      synopsis = "A library for client-side HTTP";
      description = "The HTTP package supports client-side web programming in Haskell. It lets you set up\nHTTP connections, transmitting requests and processing the responses coming back, all\nfrom within the comforts of Haskell. It's dependent on the network package to operate,\nbut other than that, the implementation is all written in Haskell.\n\nA basic API for issuing single HTTP requests + receiving responses is provided. On top\nof that, a session-level abstraction is also on offer  (the @BrowserAction@ monad);\nit taking care of handling the management of persistent connections, proxies,\nstate (cookies) and authentication credentials required to handle multi-step\ninteractions with a web server.\n\nThe representation of the bytes flowing across is extensible via the use of a type class,\nletting you pick the representation of requests and responses that best fits your use.\nSome pre-packaged, common instances are provided for you (@ByteString@, @String@).\n\nHere's an example use:\n\n>\n>    do\n>      rsp <- Network.HTTP.simpleHTTP (getRequest \"http://www.haskell.org/\")\n>              -- fetch document and return it (as a 'String'.)\n>      fmap (take 100) (getResponseBody rsp)\n>\n>    do\n>      (_, rsp)\n>         <- Network.Browser.browse \$ do\n>               setAllowRedirects True -- handle HTTP redirects\n>               request \$ getRequest \"http://www.haskell.org/\"\n>      return (take 100 (rspBody rsp))";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."array" or (errorHandler.buildDepError "array"))
          (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ] ++ [
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          ]) ++ (pkgs.lib).optional (system.isWindows) (hsPkgs."Win32" or (errorHandler.buildDepError "Win32"));
        build-tools = [
          (hsPkgs.buildPackages.ghc.components.exes.ghc or (pkgs.buildPackages.ghc or (errorHandler.buildToolDepError "ghc:ghc")))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."HTTP" or (errorHandler.buildDepError "HTTP"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."httpd-shed" or (errorHandler.buildDepError "httpd-shed"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (errorHandler.buildDepError "case-insensitive"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."http-types" or (errorHandler.buildDepError "http-types"))
            (hsPkgs."wai" or (errorHandler.buildDepError "wai"))
            (hsPkgs."warp" or (errorHandler.buildDepError "warp"))
            (hsPkgs."pureMD5" or (errorHandler.buildDepError "pureMD5"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            ] ++ (if flags.conduit10
            then [
              (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
              ]
            else [
              (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
              (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
              ]);
          build-tools = [
            (hsPkgs.buildPackages.ghc.components.exes.ghc or (pkgs.buildPackages.ghc or (errorHandler.buildToolDepError "ghc:ghc")))
            ];
          buildable = true;
          };
        };
      };
    }