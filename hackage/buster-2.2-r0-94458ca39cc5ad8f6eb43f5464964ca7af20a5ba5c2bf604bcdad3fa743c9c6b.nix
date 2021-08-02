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
      specVersion = "1.0";
      identifier = { name = "buster"; version = "2.2"; };
      license = "BSD-3-Clause";
      copyright = "2009 Renaissance Computing Institute";
      maintainer = "Jeff Heard <jeff@renci.org>";
      author = "Jeff Heard";
      homepage = "http://vis.renci.org/jeff/buster";
      url = "";
      synopsis = "Almost but not quite entirely unlike FRP";
      description = "Buster is best described by the following blog post: http:\\/\\/vis.renci.org\\/jeff\\/2009\\/03\\/31\\/almost-but-not-quite-entirely-like-frp\\/\n\nIt is an engine for orchestrating large, complex, and multifaceted applications by couching them in terms of time, events, a bus,\nbehaviours, and widgets.  Time is continuous and infininte.  Events are discrete and exist for a particular time.  The bus is a\ndiscrete sample of time made available to behaviours. Behaviours are continuous and exist for all time, but sample time via\nthe bus.  They filter Events to determine what is on the bus at future times.  Widgets are input-only objects that sample the\noutside world and assign events to discrete portions of time.\n\nBuster is designed to be flexible, with a flexible event model and the ability to add custom data to events, and designed to be\nhigh performance.  It is simple to integrate with Gtk while at the same time able to handle other kinds of resources, like files\nand sockets.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."dataenc" or (errorHandler.buildDepError "dataenc"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
          (hsPkgs."parsec" or (errorHandler.buildDepError "parsec"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
        buildable = true;
        };
      };
    }