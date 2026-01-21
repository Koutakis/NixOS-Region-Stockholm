with import <nixpkgs> { };
let
  pythonEnv = python3.withPackages (ps: [ # python packages here
    ps.pyyaml
    ps.pandas
    ps.paramiko
    ps.requests
    ps.sqlalchemy
    ps.psycopg2
    ps.numpy
    ps.matplotlib
    ps.pyarrow
    ps.polars
  ]);
in
mkShell {
  packages = [ # System programs here
    pythonEnv
    git
    vim
    curl
    ranger
    neovim
    uv
  ];

  shellHook = ''
    if [ ! -d .venv ]; then
      python -m venv .venv
    fi
    source .venv/bin/activate
    pip install roskarl sqlmesh
  '';

}
