define virtualenv::install_requirements(
  $virtualenv,
  $user = undef
) {
  
  exec { "pip_requirements ${virtualenv} ${name}":
    command     => "${virtualenv::script_path} pip install --environment=\$HOME/.virtualenvs/${virtualenv} -r ${name}",
    user        => $user,
    require     => [Package['virtualenvwrapper'], File['bash_virtualenv']],
    environment => ["HOME=~${user}"],
    provider    => shell,
  }
  
}