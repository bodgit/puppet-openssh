# Configure an SSH subsystem
#
# @example Configure SFTP
#   ::openssh::server::subsystem { 'sftp':
#     command => '/usr/libexec/openssh/sftp-server',
#   }
#
# @param command
# @param subsystem
#
# @see puppet_classes::openssh::server ::openssh::server
define openssh::server::subsystem (
  String $command,
  String $subsystem = $title,
) {

  if ! defined(Class['::openssh::server']) {
    fail('You must include the openssh::server base class before using any openssh::server defined resources')
  }

  ::concat::fragment { "${module_name} server subsystem ${subsystem}":
    target  => $::openssh::server::conf_file,
    order   => 20,
    content => template("${module_name}/server/subsystem.erb"),
  }
}
