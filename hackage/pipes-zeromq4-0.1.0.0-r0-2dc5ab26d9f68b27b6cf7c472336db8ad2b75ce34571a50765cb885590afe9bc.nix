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
    flags = { examples = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "pipes-zeromq4"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2015 Matthew Peddie";
      maintainer = "Matthew Peddie <mpeddie@gmail.com>";
      author = "Matthew Peddie <mpeddie@gmail.com>";
      homepage = "http://github.com/peddie/pipes-zeromq4";
      url = "";
      synopsis = "Pipes integration for ZeroMQ messaging";
      description = "<https://hackage.haskell.org/package/pipes Pipes> integration for\n<http://zeromq.org/ ZeroMQ> using the\n<https://hackage.haskell.org/package/zeromq4-haskell zeromq4-haskell bindings>.\n\nThis package is very basic.  I am new to the @Pipes@ family of APIs\nand would be overjoyed to receive feedback.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."zeromq4-haskell" or (errorHandler.buildDepError "zeromq4-haskell"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
          (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
          (hsPkgs."pipes-safe" or (errorHandler.buildDepError "pipes-safe"))
          ];
        buildable = true;
        };
      exes = {
        "proxy" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pipes-zeromq4" or (errorHandler.buildDepError "pipes-zeromq4"))
            (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
            (hsPkgs."pipes-safe" or (errorHandler.buildDepError "pipes-safe"))
            (hsPkgs."zeromq4-haskell" or (errorHandler.buildDepError "zeromq4-haskell"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            ];
          buildable = if flags.examples then true else false;
          };
        "client" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pipes-zeromq4" or (errorHandler.buildDepError "pipes-zeromq4"))
            (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
            (hsPkgs."pipes-safe" or (errorHandler.buildDepError "pipes-safe"))
            (hsPkgs."zeromq4-haskell" or (errorHandler.buildDepError "zeromq4-haskell"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
            ];
          buildable = if flags.examples then true else false;
          };
        "server" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."pipes-zeromq4" or (errorHandler.buildDepError "pipes-zeromq4"))
            (hsPkgs."pipes" or (errorHandler.buildDepError "pipes"))
            (hsPkgs."pipes-safe" or (errorHandler.buildDepError "pipes-safe"))
            (hsPkgs."zeromq4-haskell" or (errorHandler.buildDepError "zeromq4-haskell"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))
            ];
          buildable = if flags.examples then true else false;
          };
        };
      };
    }