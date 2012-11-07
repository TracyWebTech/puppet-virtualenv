define virtualenv::install_package(
    $virtualenv,
    $user = undef
) {

  exec { "pip_requirements ${virtualenv} ${name}":
    command     => "${virtualenv::script_path}/install_package ${virtualenv} ${name}",
    user        => $user,
    require     => [Package['virtualenvwrapper'], File['install_package']],
    environment => ["HOME=~${user}"],
    provider    => shell,
  }

  
}