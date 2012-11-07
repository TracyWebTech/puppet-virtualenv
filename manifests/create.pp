define virtualenv::create(
  $user = undef
  $project = ""
) {

  exec { "create_virtualenv ${name}":
    command     => "${virtualenv::script_path}/mkvirtualenv.sh ${name} ${project}",
    user        => $user,
    require     => [Package['virtualenvwrapper'], File['mkvirtualenv']],
    environment => ["HOME=~${user}"],
    provider    => shell,
  }


}