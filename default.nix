{ pkgs ? import <nixpkgs> {} }:

let
  easy-ps-repo = builtins.fromJSON (builtins.readFile ./easy-purescript-nix.json);

  easy-ps-src = pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    inherit (easy-ps-repo) rev sha256;
  };
  
  easy-ps = import easy-ps-src { };

  buildInputs = builtins.attrValues {
    inherit (pkgs) nodejs-10_x yarn;
    inherit (easy-ps) purs-0_13_5 spago;
  };

in
  pkgs.mkShell {
    buildInputs = buildInputs;
  }
