define virtualenv::install_requirements(
  $requirements = $title,
  $venv,
  $user
) {

  exec { "pip_requirements ${venv} ${requirements}":
    command => "pip install -r ${requirements}",
    user    => $user,
    path    => ["${venv}/bin", "/usr/local/bin", "/usr/bin", "/bin"],
  }
  
}
