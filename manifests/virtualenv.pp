define virtualenv::virtualenv(
  $venv = $title,
  $ensure = present,
  $user = undef,
  $requirements = undef,
  $packages = undef
) {

  case $ensure {

    absent: {
      file { $venv:
        ensure => absent,
        force  => true,
      }
    }
    present: {
      if !$user {
        fail('user is required to ensure present')
      }
      exec { "create_virtualenv ${venv}":
        command => "virtualenv ${venv}",
        user    => $user,
        require => Package['python-virtualenv'],
        path    => ['/usr/bin'],
        creates => "${venv}/bin/",
      }

      exec { "update distribute ${venv}":
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
          require     => Exec["update distribute ${venv}"],
          refreshonly => true,
          timeout     => 0,
        }
      }

      if $packages {
        exec { "install_packages ${venv} ${packages}":
          command     => "pip install ${packages}",
          user        => $user,
          path        => ["${venv}/bin", "/usr/local/bin", "/usr/bin", "/bin"],
          subscribe   => Exec["create_virtualenv ${venv}"],
          require     => Exec["update distribute ${venv}"],
          refreshonly => true,
          timeout     => 0,
        }
      }
    }
    default: {
      fail('invalid ensure')
    }
  }

}
