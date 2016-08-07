# Installs and manages SSH public key lookups from LDAP.
#
# @example Declaring the class
#   class { '::openssh::server':
#     authorized_keys_command      => '/usr/libexec/openssh/ssh-ldap-helper',
#     authorized_keys_command_user => 'nobody',
#   }
#
#   class { '::openssh::server::ldap':
#     base_dn => 'ou=people,dc=example,dc=com',
#     uri     => [
#       'ldap://ldap.example.com',
#     ],
#   }
#
# @param base_dn
# @param uri
# @param conf_file
# @param manage_package
# @param package_name
# @param account_class
# @param bind_dn
# @param bind_policy
# @param bind_pw
# @param bind_time_limit
# @param debug
# @param deref
# @param filter
# @param log_dir
# @param referrals
# @param restart
# @param scope
# @param search_format
# @param ssl
# @param time_limit
# @param tls_cacert_dir
# @param tls_cacert_file
# @param tls_cert
# @param tls_check_peer
# @param tls_ciphers
# @param tls_key
# @param tls_randfile
# @param version
#
# @see puppet_classes::openssh::server ::openssh::server
# @see puppet_classes::openssh::server::sftp ::openssh::server::sftp
class openssh::server::ldap (
  Bodgitlib::LDAP::DN                                       $base_dn,
  Array[Bodgitlib::LDAP::URI::Simple, 1]                    $uri,
  Stdlib::Absolutepath                                      $conf_file,
  Boolean                                                   $manage_package,
  Optional[String]                                          $package_name    = undef,
  Optional[String]                                          $account_class   = undef,
  Optional[Bodgitlib::LDAP::DN]                             $bind_dn         = undef,
  Optional[Enum['hard', 'hard_open', 'hard_init', 'soft']]  $bind_policy     = undef,
  Optional[String]                                          $bind_pw         = undef,
  Optional[Integer[0]]                                      $bind_time_limit = undef,
  Optional[String]                                          $debug           = undef,
  Optional[Enum['never', 'searching', 'finding', 'always']] $deref           = undef,
  Optional[Bodgitlib::LDAP::Filter]                         $filter          = undef,
  Optional[Stdlib::Absolutepath]                            $log_dir         = undef,
  Optional[Boolean]                                         $referrals       = undef,
  Optional[Boolean]                                         $restart         = undef,
  Optional[Enum['base', 'one', 'subtree', 'sub']]           $scope           = undef,
  Optional[Bodgitlib::LDAP::Filter]                         $search_format   = undef,
  Optional[Variant[Boolean, Enum['start_tls']]]             $ssl             = undef,
  Optional[Integer[0]]                                      $time_limit      = undef,
  Optional[Stdlib::Absolutepath]                            $tls_cacert_dir  = undef,
  Optional[Stdlib::Absolutepath]                            $tls_cacert_file = undef,
  Optional[Stdlib::Absolutepath]                            $tls_cert        = undef,
  Optional[Enum['never', 'hard', 'demand', 'allow', 'try']] $tls_check_peer  = undef,
  Optional[String]                                          $tls_ciphers     = undef,
  Optional[Stdlib::Absolutepath]                            $tls_key         = undef,
  Optional[Stdlib::Absolutepath]                            $tls_randfile    = undef,
  Optional[Integer[2, 3]]                                   $version         = undef,
) {

  if ! defined(Class['::openssh::server']) {
    fail('You must include the openssh::server class before using the openssh::server::ldap class')
  }

  contain ::openssh::server::ldap::install
  contain ::openssh::server::ldap::config

  Class['::openssh::server::ldap::install'] ~> Class['::openssh::server::ldap::config']
}
