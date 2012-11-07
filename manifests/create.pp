define virtualenv::create(
  $user = undef
) {

  exec { "create_virtualenv ${name}":
    command     => "${virtualenv::script_path} mkvirtualenv ${name}",
    user        => $user,
    require     => [Package['virtualenvwrapper'], File['bash_virtualenv']],
    environment => ["HOME=~${user}"],
    provider    => shell,
    unless      => "test -d \$HOME/.virtualenvs/${name}",
  }


}