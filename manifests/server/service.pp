# @!visibility private
class openssh::server::service {

  service { $::openssh::server::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
