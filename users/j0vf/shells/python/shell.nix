with import <nixpkgs> { };
let
  pythonEnv = python3.withPackages (ps: [
    ps.pandas
    ps.paramiko
    ps.requests
    ps.psycopg
    ps.numpy
    ps.polars
    ps.pyodbc
    ps.croniter
  ]);
in
mkShell {
  packages = [
    pythonEnv
    git
    curl
    ranger
    neovim
    uv
  ];
  shellHook = ''
    if [ ! -d .venv ]; then
      uv venv .venv
      source .venv/bin/activate
      uv pip install roskarl bollhav cornflex paramiko kolada
    else
      source .venv/bin/activate
    fi
  '';
}
