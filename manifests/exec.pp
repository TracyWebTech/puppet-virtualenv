define virtualenv::exec(
  $command = $name,
  $virtualenv,
  $user = undef
) {
  
  exec { "virtualenv exec ${virtualenv} ${command}":
    command     => "virtualenv_exec ${virtualenv} ${command}",
    path        => '/usr/local/bin',
    user        => $user,
    require     => [Package['virtualenvwrapper'], File['virtualenv_exec']],
    environment => ["HOME=~${user}"],
    provider    => shell,
  }
  
}
