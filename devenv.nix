{ pkgs, lib, config, inputs, ... }:

let
   pkgs-unstable = import inputs.nixpkgs-unstable { system = pkgs.stdenv.system; };
in {
  # https://devenv.sh/basics/
  #env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ pkgs.git ];

  languages.python = {
    enable = true;
    poetry = {
      enable = true;
      install = {
        enable = true;
        installRootPackage = true;
        onlyInstallRootPackage = false;
        compile = false;
        quiet = false;
        groups = [ ];
        ignoredGroups = [ ];
        onlyGroups = [ ];
        extras = [ ];
        allExtras = false;
        verbosity = "no";
      };
      activate.enable = true;
      package = pkgs-unstable.poetry;  # to fix https://github.com/python-poetry/poetry/issues/9885
    };
  };

  dotenv.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/

  # https://devenv.sh/tasks/
  #tasks = {
  #  "myproj:setup".exec = "mytool build";
  #  "devenv:enterShell".after = [ "myproj:setup" ];
  #};

  # https://devenv.sh/tests/
  #enterTest = ''
  #  echo "Running tests"
  #  git --version | grep --color=auto "${pkgs.git.version}"
  #'';

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
