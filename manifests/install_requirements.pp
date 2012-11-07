define virtualenv::install_requirements(
  $requirements = $title,
  $venv,
  $user
) {

  exec { "pip_requirements ${venv} ${requirements}":
    command => "pip install --environment=${venv} -r ${requirements}",
    user    => $user,
    path    => ['/usr/bin'],
  }
  
}
