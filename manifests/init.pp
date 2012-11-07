class virtualenv {
    package { "python-virtualenv":
        ensure => installed,
    }
}