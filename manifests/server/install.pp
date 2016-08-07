# @!visibility private
class openssh::server::install {

  if $::openssh::server::manage_package {
    package { $::openssh::server::package_name:
      ensure => present,
    }
  }
}
