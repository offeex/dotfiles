rec {
  fnListDirs = (path:
    builtins.map (el: path + /./${el.name}) (builtins.filter (el: el.type == "directory") (
      builtins.attrValues (builtins.mapAttrs (name: value: { inherit name; type = value; }) (builtins.readDir path))
    ))
  );

  fnListDirsWithDefault = (path:
    builtins.filter (el: builtins.pathExists (el + /./default.nix)) (fnListDirs path)
  );
}
