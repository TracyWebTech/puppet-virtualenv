define virtualenv::install_package(
  $package_name = $title,
  $venv,
  $user
) {

  exec { "pip_package ${venv} ${package_name}":
    command => "pip install --environment=${venv} ${package_name}",
    user    => $user,
    path    => ['/usr/bin'],
  }
  
}
