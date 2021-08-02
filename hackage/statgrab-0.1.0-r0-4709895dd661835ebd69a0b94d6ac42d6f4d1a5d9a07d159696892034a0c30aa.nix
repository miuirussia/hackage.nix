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
      identifier = { name = "statgrab"; version = "0.1.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Copyright (c) 2013 Brendan Hay";
      maintainer = "Brendan Hay <brendan.g.hay@gmail.com>";
      author = "Brendan Hay";
      homepage = "http://github.com/brendanhay/statgrab";
      url = "";
      synopsis = "Collect system level metrics and statistics";
      description = "Provides an interface to the cross platform system statistics C library libstatgrab.\n\nIt supports a wide range of system statistics including CPU usage, memory utilisation,\ndisk usage, process counts, network traffic, disk I/O, and more.\n\nThe current list of supported and tested platforms for the underlying library\nincludes OSX, FreeBSD, Linux, NetBSD, OpenBSD, Solaris, DragonFly BSD, HP-UX and AIX.\n\n/Requirements:/\n\n* libstatgrab @0.9.0@ must be installed on the target system.\n\n* Be aware that currently these bindings have been developed and tested\nonly on OSX/Linux.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."async" or (errorHandler.buildDepError "async"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."MonadCatchIO-transformers" or (errorHandler.buildDepError "MonadCatchIO-transformers"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        libs = [ (pkgs."statgrab" or (errorHandler.sysDepError "statgrab")) ];
        buildable = true;
        };
      };
    }