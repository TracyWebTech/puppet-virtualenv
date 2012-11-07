define virtualenv::install_package(
    $virtualenv,
    $user = undef
) {

  exec { "pip_requirements ${virtualenv} ${name}":
    command     => "${virtualenv::script_path} pip install --environment=\$HOME/.virtualenvs/${virtualenv} ${name}",
    user        => $user,
    require     => [Package['virtualenvwrapper'], File['bash_virtualenv']],
    environment => ["HOME=~${user}"],
    provider    => shell,
  }

  
}