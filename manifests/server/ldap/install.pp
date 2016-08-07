# @!visibility private
class openssh::server::ldap::install {

  if $::openssh::server::ldap::manage_package {
    package { $::openssh::server::ldap::package_name:
      ensure => present,
    }
  }
}
