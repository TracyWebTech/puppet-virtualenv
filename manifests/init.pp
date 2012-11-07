class virtualenv {

  $script_path = '/tmp/puppet_virtualenvwrapper.sh'

  package { "virtualenvwrapper":
    ensure => installed,
  }

  file { 'bash_virtualenv':
    path   => $script_path,
    ensure => present,
    source => 'puppet:///modules/virtualenv/virtualenvwrapper.sh',
    mode   => '0755',
    owner  => 'root',
    group  => 'root'
  }
}