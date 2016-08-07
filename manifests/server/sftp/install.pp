# @!visibility private
class openssh::server::sftp::install {

  if $::openssh::server::sftp::manage_package {
    package { $::openssh::server::sftp::package_name:
      ensure => present,
    }
  }
}
