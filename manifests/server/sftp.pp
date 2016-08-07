# Installs the SFTP subsystem
#
# @example Declaring the class
#   include ::openssh::server
#   include ::openssh::server::sftp
#
# @param manage_package
# @param package_name
# @param command
#
# @see puppet_classes::openssh::server ::openssh::server
class openssh::server::sftp (
  Boolean              $manage_package,
  Optional[String]     $package_name   = undef,
  Stdlib::Absolutepath $command,
) {

  if ! defined(Class['::openssh::server']) {
    fail('You must include the openssh::server class before using the openssh::server::sftp class')
  }

  contain ::openssh::server::sftp::install
  contain ::openssh::server::sftp::config

  Class['::openssh::server::sftp::install'] ~> Class['::openssh::server::sftp::config']
}
