define virtualenv::create(
  $venv = $title,
  $user,
  $requirements = undef,
  $packages = undef
) {

  exec { "create_virtualenv ${venv}":
    command => "virtualenv ${venv}",
    user    => $user,
    require => Package['python-virtualenv'],
    path    => ['/usr/bin'],
    unless  => "test -d ${venv}/bin",
  }

  exec { "update distribute ${venv} ${requirements}":
    command     => "pip install -U distribute",
    user        => $user,
    path        => ["${venv}/bin", "/usr/local/bin", "/usr/bin", "/bin"],
    subscribe   => Exec["create_virtualenv ${venv}"],
    refreshonly => true,
  }

  if $requirements {
    exec { "install_requirements ${venv} ${requirements}":
      command     => "pip install -r ${requirements}",
      user        => $user,
      path        => ["${venv}/bin", "/usr/local/bin", "/usr/bin", "/bin"],
      subscribe   => Exec["create_virtualenv ${venv}"],
      require     => Exec["update distribute ${venv} ${requirements}"],
      refreshonly => true,
      timeout     => 0,
    }
  }

  if $packages {
    exec { "install_packages ${venv} ${packages}":
      command     => "pip install --environment=${venv} ${packages}",
      user        => $user,
      path        => ["${venv}/bin", "/usr/local/bin", "/usr/bin", "/bin"],
      subscribe   => Exec["create_virtualenv ${venv}"],
      require     => Exec["update distribute ${venv} ${requirements}"],
      refreshonly => true,
      timeout     => 0,
    }
  }

 

}
