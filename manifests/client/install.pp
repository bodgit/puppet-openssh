# @!visibility private
class openssh::client::install {

  if $::openssh::client::manage_package {
    package { $::openssh::client::package_name:
      ensure => present,
    }
  }
}
