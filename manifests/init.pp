class virtualenv {

  $script_path = '/tmp/puppet_virtualenvwrapper'

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

  file { 'virtualenv_exec':
    path    => "/usr/local/bin/virtualenv_exec",
    ensure  => present,
    source  => 'puppet:///modules/virtualenv/virtualenv_exec.sh',
    mode    => '0755',
    owner   => 'root',
    group   => 'root',   
    require => File[$script_path],
  }
}
