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
    flags = { debug = false; history = false; unittests = true; };
    package = {
      specVersion = "2.2";
      identifier = { name = "clash-lib"; version = "1.2.5"; };
      license = "BSD-2-Clause";
      copyright = "Copyright © 2012-2016, University of Twente,\n2016-2019, Myrtle Software Ltd,\n2017-2019, QBayLogic B.V., Google Inc.";
      maintainer = "QBayLogic B.V. <devops@qbaylogic.com>";
      author = "The Clash Authors";
      homepage = "https://clash-lang.org/";
      url = "";
      synopsis = "CAES Language for Synchronous Hardware - As a Library";
      description = "Clash is a functional hardware description language that borrows both its\nsyntax and semantics from the functional programming language Haskell. The\nClash compiler transforms these high-level descriptions to low-level\nsynthesizable VHDL, Verilog, or SystemVerilog.\n\nFeatures of Clash:\n\n* Strongly typed, but with a very high degree of type inference, enabling both\nsafe and fast prototyping using concise descriptions.\n\n* Interactive REPL: load your designs in an interpreter and easily test all\nyour component without needing to setup a test bench.\n\n* Higher-order functions, with type inference, result in designs that are\nfully parametric by default.\n\n* Synchronous sequential circuit design based on streams of values, called\n@Signal@s, lead to natural descriptions of feedback loops.\n\n* Support for multiple clock domains, with type safe clock domain crossing.\n\n\nThis package provides:\n\n* The CoreHW internal language: SystemF + Letrec + Case-decomposition\n\n* The normalisation process that brings CoreHW in a normal form that can be\nconverted to a netlist\n\n* Blackbox/Primitive Handling\n\n\nFront-ends (for: parsing, typecheck, etc.) are provided by separate packages:\n\n* <https://hackage.haskell.org/package/clash-ghc GHC/Haskell Frontend>\n\n* <https://github.com/christiaanb/Idris-dev Idris Frontend>\n\n\nPrelude library: <https://hackage.haskell.org/package/clash-prelude>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."ansi-terminal" or (errorHandler.buildDepError "ansi-terminal"))
          (hsPkgs."attoparsec" or (errorHandler.buildDepError "attoparsec"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."clash-prelude" or (errorHandler.buildDepError "clash-prelude"))
          (hsPkgs."concurrent-supply" or (errorHandler.buildDepError "concurrent-supply"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-binary-ieee754" or (errorHandler.buildDepError "data-binary-ieee754"))
          (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."dlist" or (errorHandler.buildDepError "dlist"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."errors" or (errorHandler.buildDepError "errors"))
          (hsPkgs."exceptions" or (errorHandler.buildDepError "exceptions"))
          (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
          (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."haskell-src-meta" or (errorHandler.buildDepError "haskell-src-meta"))
          (hsPkgs."hint" or (errorHandler.buildDepError "hint"))
          (hsPkgs."integer-gmp" or (errorHandler.buildDepError "integer-gmp"))
          (hsPkgs."interpolate" or (errorHandler.buildDepError "interpolate"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."ordered-containers" or (errorHandler.buildDepError "ordered-containers"))
          (hsPkgs."parsers" or (errorHandler.buildDepError "parsers"))
          (hsPkgs."prettyprinter" or (errorHandler.buildDepError "prettyprinter"))
          (hsPkgs."primitive" or (errorHandler.buildDepError "primitive"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."reducers" or (errorHandler.buildDepError "reducers"))
          (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
          (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          (hsPkgs."terminal-size" or (errorHandler.buildDepError "terminal-size"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."text-show" or (errorHandler.buildDepError "text-show"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."trifecta" or (errorHandler.buildDepError "trifecta"))
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."vector-binary-instances" or (errorHandler.buildDepError "vector-binary-instances"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
        buildable = true;
        };
      tests = {
        "unittests" = {
          depends = (pkgs.lib).optionals (!(!flags.unittests)) [
            (hsPkgs."clash-prelude" or (errorHandler.buildDepError "clash-prelude"))
            (hsPkgs."clash-lib" or (errorHandler.buildDepError "clash-lib"))
            (hsPkgs."ghc-typelits-knownnat" or (errorHandler.buildDepError "ghc-typelits-knownnat"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."concurrent-supply" or (errorHandler.buildDepError "concurrent-supply"))
            (hsPkgs."data-default" or (errorHandler.buildDepError "data-default"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."haskell-src-exts" or (errorHandler.buildDepError "haskell-src-exts"))
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            ];
          buildable = if !flags.unittests then false else true;
          };
        };
      };
    }