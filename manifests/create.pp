define virtualenv::create(
  $venv = $title,
  $user
) {

  exec { "create_virtualenv ${venv}":
    command => "virtualenv ${venv}",
    user    => $user,
    require => Package['python-virtualenv'],
    path    => ['/usr/bin'],
    unless  => "test -d ${venv_path}/bin",
  }

}
