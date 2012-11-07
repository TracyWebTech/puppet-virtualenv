class virtualenv {

  $script_path = '/tmp/puppet_virtualenvwrapper/'

  package { "virtualenvwrapper":
    ensure => installed,
  }

  file { $script_path:
    ensure => directory,
    mode => '0755',
    owner  => 'root',
    group  => 'root'

  }

  file { 'mkvirtualenv':
    path    => "${script_path}/mkvirtualenv.sh",
    ensure  => present,
    source  => 'puppet:///modules/virtualenv/mkvirtualenv.sh',
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    require => File[$script_path],
  }

  file { 'install_package':
    path    => "${script_path}/install_package.sh",
    ensure  => present,
    source  => 'puppet:///modules/virtualenv/install_package.sh',
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    require => File[$script_path],
  }

  # file { 'install_requirements':
  #   path    => "${script_path}/install_requirements.sh",
  #   ensure  => present,
  #   source  => 'puppet:///modules/virtualenv/install_requirements.sh',
  #   mode    => '0755',
  #   owner   => 'root',
  #   group   => 'root',
  #   require => File[$script_path],
  # }
}