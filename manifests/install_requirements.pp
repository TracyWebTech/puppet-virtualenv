define virtualenv::install_requirements(
  $virtualenv,
  $user = undef
) {
  
  exec { "pip_requirements ${virtualenv} ${name}":
    command     => "${virtualenv::script_path}/install_requirements.sh ${virtualenv} ${name}",
    user        => $user,
    require     => [Package['virtualenvwrapper'], File['install_requirements']],
    environment => ["HOME=~${user}"],
    provider    => shell,
  }
  
}
