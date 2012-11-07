define virtualenv::exec(
  $command = $name,
  $virtualenv,
  $user = undef
) {
  
  exec { "virtualenv exec ${virtualenv} ${command}":
    command     => "${virtualenv::script_path}/virtualenv_exec.sh ${virtualenv} ${command}",
    user        => $user,
    require     => [Package['virtualenvwrapper'], File['virtualenv_exec']],
    environment => ["HOME=~${user}"],
    provider    => shell,
  }
  
}
