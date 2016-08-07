# @!visibility private
class openssh::server::ldap::config {

  $conf_file       = $::openssh::server::ldap::conf_file
  $account_class   = $::openssh::server::ldap::account_class
  $base_dn         = $::openssh::server::ldap::base_dn
  $bind_dn         = $::openssh::server::ldap::bind_dn
  $bind_policy     = $::openssh::server::ldap::bind_policy
  $bind_pw         = $::openssh::server::ldap::bind_pw
  $bind_time_limit = $::openssh::server::ldap::bind_time_limit
  $debug           = $::openssh::server::ldap::debug
  $deref           = $::openssh::server::ldap::deref
  $filter          = $::openssh::server::ldap::filter
  $log_dir         = $::openssh::server::ldap::log_dir
  $referrals       = $::openssh::server::ldap::referrals
  $restart         = $::openssh::server::ldap::restart
  $scope           = $::openssh::server::ldap::scope
  $search_format   = $::openssh::server::ldap::search_format
  $ssl             = $::openssh::server::ldap::ssl
  $time_limit      = $::openssh::server::ldap::time_limit
  $tls_cacert_dir  = $::openssh::server::ldap::tls_cacert_dir
  $tls_cacert_file = $::openssh::server::ldap::tls_cacert_file
  $tls_cert        = $::openssh::server::ldap::tls_cert
  $tls_check_peer  = $::openssh::server::ldap::tls_check_peer
  $tls_ciphers     = $::openssh::server::ldap::tls_ciphers
  $tls_key         = $::openssh::server::ldap::tls_key
  $tls_randfile    = $::openssh::server::ldap::tls_randfile
  $uri             = $::openssh::server::ldap::uri
  $version         = $::openssh::server::ldap::version

  file { $conf_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template("${module_name}/ldap.conf.erb"),
  }
}
