define virtualenv::create(
  $venv = $title,
  $user,
  $requirements = undef
) {

  exec { "create_virtualenv ${venv}":
    command => "virtualenv ${venv}",
    user    => $user,
    require => Package['python-virtualenv'],
    path    => ['/usr/bin'],
    unless  => "test -d ${venv}/bin",
  }

  if $requirements {
    exec { "install_requirements ${venv} ${requirements}":
      command     => "pip install --environment=${venv} -r ${requirements}",
      user        => $user,
      path        => ['/usr/bin'],
      subscribe   => Exec["create_virtualenv ${venv}"],
      refreshonly => true,
    }
  }

 

}
