define virtualenv::install_package(
  $package_name = $title,
  $venv,
  $user
) {

  exec { "pip_package ${venv} ${package_name}":
    command => "pip install ${package_name}",
    user    => $user,
    path    => ["${venv}/bin", "/usr/local/bin", "/usr/bin", "/bin"],
    timeout => 0,
  }
  
}
