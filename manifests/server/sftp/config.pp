# @!visibility private
class openssh::server::sftp::config {

  ::openssh::server::subsystem { 'sftp':
    command => $::openssh::server::sftp::command,
  }
}
