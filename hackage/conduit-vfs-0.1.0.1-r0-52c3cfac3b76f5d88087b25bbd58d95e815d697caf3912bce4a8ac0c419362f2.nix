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
      identifier = { name = "conduit-vfs"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "(c)2019 Robert Fischer. All Rights Reserved. See LICENSE for liscensing terms.";
      maintainer = "smokejumperit@gmail.com";
      author = "Robert Fischer";
      homepage = "https://github.com/RobertFischer/vfs-conduit#readme";
      url = "";
      synopsis = "Virtual file system for Conduit; disk, pure, and in-memory impls.";
      description = "The goal of this package is to provide a common library and the core implementations for things that can be made to look like filesystems. In this package, a \"filesystem\" is tree of nodes, where the leaf nodes are files and the rest are directories. A \"directory\" is defined as a node that contains other nodes, and those other nodes are each keyed by a name. A \"file\" is defined as a collection of (possibly empty) bytes.\nThis package includes the core types for a Virtual File System (VFS) abstraction for conduit, along with three implementations. The implementations are \"disk\" (write to the underlying filesystem), \"in-memory\" (store files in an MVar), and \"pure\" (pass state in a State monad). Because of the nature of conduits, this library defaults to lazy implementations of various data structures, including lazy ByteStrings and lazy HashMaps. Any overhead in space should be more than warranted by the savings through just-in-time computations.\nFor more information, see the README on GitHub at <https://github.com/RobertFischer/vfs-conduit#README.md>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."classy-prelude" or (errorHandler.buildDepError "classy-prelude"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."monad-loops" or (errorHandler.buildDepError "monad-loops"))
          (hsPkgs."mono-traversable" or (errorHandler.buildDepError "mono-traversable"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
          (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
          (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
          ];
        buildable = true;
        };
      tests = {
        "conduit-vfs-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."classy-prelude" or (errorHandler.buildDepError "classy-prelude"))
            (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
            (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
            (hsPkgs."conduit-vfs" or (errorHandler.buildDepError "conduit-vfs"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."extra" or (errorHandler.buildDepError "extra"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."monad-loops" or (errorHandler.buildDepError "monad-loops"))
            (hsPkgs."mono-traversable" or (errorHandler.buildDepError "mono-traversable"))
            (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."unix" or (errorHandler.buildDepError "unix"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
            (hsPkgs."unordered-containers" or (errorHandler.buildDepError "unordered-containers"))
            ];
          buildable = true;
          };
        };
      };
    }