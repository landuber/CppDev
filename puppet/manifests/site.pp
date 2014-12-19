class apt_update {
  exec {'aptGetUpdate':
    command => "sudo apt-get update",
    path => ["/bin", "/usr/bin"]
  }
 }

class apt_build_essential {
    exec {'aptBuildEssential':
      command => "sudo apt-get --yes --force-yes install build-essential checkinstall",
      path => ["/bin", "/usr/bin"],
      require => Exec["aptGetUpdate"]
    }
}

class apt_scons {
    exec {'aptScons':
      command => "sudo apt-get --yes --force-yes install scons",
      path => ["/bin", "/usr/bin"],
      require => Exec["aptGetUpdate"]
    }
}

class othertools {
    package { "git":
        ensure => latest,
        require => Exec["aptGetUpdate"]
    }

    package { "vim-common":
        ensure => latest,
        require => Exec["aptGetUpdate"]
    }

    package { "curl":
        ensure => present,
        require => Exec["aptGetUpdate"]
    }

    package { "htop":
        ensure => present,
        require => Exec["aptGetUpdate"]
    }
}


include apt_update
include apt_build_essential
include apt_scons
include othertools
