# Installs and manages the OpenSSH server.
#
# @example Declaring the class using the defaults for the OS
#   include ::openssh::server
#
# @example Perform some basic securing
#   class { '::openssh::server':
#     allow_groups                      => ['ssh-user'],
#     challenge_response_authentication => false,
#     ciphers                           => [
#       'chacha20-poly1305@openssh.com',
#       'aes256-gcm@openssh.com',
#       'aes128-gcm@openssh.com',
#       'aes256-ctr',
#       'aes192-ctr',
#       'aes128-ctr',
#     ],
#     host_key                          => [
#       '/etc/ssh/ssh_host_ed25519_key',
#       '/etc/ssh/ssh_host_rsa_key',
#     ],
#     kex_algorithms                    => [
#       'curve25519-sha256@libssh.org',
#       'diffie-hellman-group-exchange-sha256',
#     ],
#     macs                              => [
#       'hmac-sha2-512-etm@openssh.com',
#       'hmac-sha2-256-etm@openssh.com',
#       'hmac-ripemd160-etm@openssh.com',
#       'umac-128-etm@openssh.com',
#       'hmac-sha2-512',
#       'hmac-sha2-256',
#       'hmac-ripemd160',
#       'umac-128@openssh.com',
#     ],
#     password_authentication           => false,
#     permit_root_login                 => false,
#     pubkey_authentication             => true,
#     protocol                          => [2],
#   }
#
# @param conf_dir
# @param conf_file
# @param manage_package
# @param package_name
# @param service_name
# @param matches
# @param subsystems
# @param accept_env
# @param address_family
# @param allow_agent_forwarding
# @param allow_groups
# @param allow_stream_local_forwarding
# @param allow_tcp_forwarding
# @param allow_users
# @param authentication_methods
# @param authorized_keys_command
# @param authorized_keys_command_user
# @param authorized_keys_command_run_as
# @param authorized_keys_file
# @param authorized_principals_command
# @param authorized_principals_command_user
# @param authorized_principals_file
# @param banner
# @param challenge_response_authentication
# @param chroot_directory
# @param ciphers
# @param client_alive_count_max
# @param client_alive_interval
# @param compression
# @param deny_groups
# @param deny_users
# @param disable_forwarding
# @param expose_authentication_methods
# @param fingerprint_hash
# @param force_command
# @param gateway_ports
# @param gssapi_authentication
# @param gssapi_key_exchange
# @param gssapi_cleanup_credentials
# @param gssapi_enable_k5users
# @param gssapi_strict_acceptor_check
# @param gssapi_store_credentials_on_rekey
# @param gssapi_kex_algorithms
# @param hostbased_accepted_key_types
# @param hostbased_authentication
# @param hostbased_uses_name_from_packet_only
# @param host_certificate
# @param host_key
# @param host_key_agent
# @param host_key_algorithms
# @param ignore_rhosts
# @param ignore_user_known_hosts
# @param ip_qos
# @param kbd_interactive_authentication
# @param kerberos_authentication
# @param kerberos_get_afs_token
# @param kerberos_or_local_passwd
# @param kerberos_ticket_cleanup
# @param kerberos_use_kuserok
# @param kex_algorithms
# @param key_regeneration_interval
# @param listen_address
# @param login_grace_time
# @param log_level
# @param macs
# @param max_auth_tries
# @param max_sessions
# @param max_startups
# @param password_authentication
# @param permit_empty_passwords
# @param permit_open
# @param permit_root_login
# @param permit_tunnel
# @param permit_tty
# @param permit_user_environment
# @param permit_user_rc
# @param pid_file
# @param port
# @param print_last_log
# @param print_motd
# @param protocol
# @param pubkey_authentication
# @param rekey_limit
# @param revoked_keys
# @param rhosts_rsa_authentication
# @param rsa_authentication
# @param server_key_bits
# @param show_patch_level
# @param stream_local_bind_mask
# @param stream_local_bind_unlink
# @param strict_modes
# @param syslog_facility
# @param tcp_keepalive
# @param trusted_user_ca_keys
# @param use_dns
# @param use_login
# @param use_pam
# @param use_privilege_separation
# @param version_addendum
# @param x11_display_offset
# @param x11_forwarding
# @param x11_max_displays
# @param x11_use_localhost
# @param xauth_location
#
# @see puppet_classes::openssh::client ::openssh::client
# @see puppet_classes::openssh::server::ldap ::openssh::server::ldap
# @see puppet_classes::openssh::server::sftp ::openssh::server::sftp
class openssh::server (
  Stdlib::Absolutepath                                                                      $conf_dir,
  Stdlib::Absolutepath                                                                      $conf_file,
  Boolean                                                                                   $manage_package,
  String                                                                                    $service_name,
  Hash[String, Hash[String, Any]]                                                           $matches,
  Hash[String, Hash[String, Any]]                                                           $subsystems,
  Optional[String]                                                                          $package_name                          = undef,
  # sshd_config settings below
  Optional[Array[String, 1]]                                                                $accept_env                            = undef,
  Optional[Enum['any', 'inet', 'inet6']]                                                    $address_family                        = undef,
  Optional[Boolean]                                                                         $allow_agent_forwarding                = undef,
  Optional[Array[String, 1]]                                                                $allow_groups                          = undef,
  Optional[Variant[Boolean, Enum['all', 'local', 'remote']]]                                $allow_stream_local_forwarding         = undef,
  Optional[Variant[Boolean, Enum['all', 'local', 'remote']]]                                $allow_tcp_forwarding                  = undef,
  Optional[Array[String, 1]]                                                                $allow_users                           = undef,
  Optional[Array[Array[String, 1], 1]]                                                      $authentication_methods                = undef,
  Optional[String]                                                                          $authorized_keys_command               = undef,
  Optional[String]                                                                          $authorized_keys_command_user          = undef,
  Optional[String]                                                                          $authorized_keys_command_run_as        = undef,
  Optional[String]                                                                          $authorized_keys_file                  = undef,
  Optional[String]                                                                          $authorized_principals_command         = undef,
  Optional[String]                                                                          $authorized_principals_command_user    = undef,
  Optional[String]                                                                          $authorized_principals_file            = undef,
  Optional[Stdlib::Absolutepath]                                                            $banner                                = undef,
  Optional[Boolean]                                                                         $challenge_response_authentication     = undef,
  Optional[String]                                                                          $chroot_directory                      = undef,
  Optional[Array[String, 1]]                                                                $ciphers                               = undef,
  Optional[Integer[0]]                                                                      $client_alive_count_max                = undef,
  Optional[Integer[0]]                                                                      $client_alive_interval                 = undef,
  Optional[Variant[Boolean, Enum['delayed']]]                                               $compression                           = undef,
  Optional[Array[String, 1]]                                                                $deny_groups                           = undef,
  Optional[Array[String, 1]]                                                                $deny_users                            = undef,
  Optional[Boolean]                                                                         $disable_forwarding                    = undef,
  Optional[Enum['never', 'pam-only', 'pam-and-env']]                                        $expose_authentication_methods         = undef,
  Optional[Enum['md5', 'sha256']]                                                           $fingerprint_hash                      = undef,
  Optional[String]                                                                          $force_command                         = undef,
  Optional[Variant[Boolean, Enum['clientspecified']]]                                       $gateway_ports                         = undef,
  Optional[Boolean]                                                                         $gssapi_authentication                 = undef,
  Optional[Boolean]                                                                         $gssapi_cleanup_credentials            = undef,
  Optional[Boolean]                                                                         $gssapi_key_exchange                   = undef,
  Optional[Boolean]                                                                         $gssapi_enable_k5users                 = undef,
  Optional[Boolean]                                                                         $gssapi_strict_acceptor_check          = undef,
  Optional[Boolean]                                                                         $gssapi_store_credentials_on_rekey     = undef,
  Optional[Array[String, 1]]                                                                $gssapi_kex_algorithms                 = undef,
  Optional[Array[String, 1]]                                                                $hostbased_accepted_key_types          = undef,
  Optional[Boolean]                                                                         $hostbased_authentication              = undef,
  Optional[Boolean]                                                                         $hostbased_uses_name_from_packet_only  = undef,
  Optional[Stdlib::Absolutepath]                                                            $host_certificate                      = undef,
  Optional[Array[Stdlib::Absolutepath, 1]]                                                  $host_key                              = undef,
  Optional[String]                                                                          $host_key_agent                        = undef,
  Optional[Array[String, 1]]                                                                $host_key_algorithms                   = undef,
  Optional[Boolean]                                                                         $ignore_rhosts                         = undef,
  Optional[Boolean]                                                                         $ignore_user_known_hosts               = undef,
  Optional[Tuple[OpenSSH::QoS, 1, 2]]                                                       $ip_qos                                = undef,
  Optional[Boolean]                                                                         $kbd_interactive_authentication        = undef,
  Optional[Boolean]                                                                         $kerberos_authentication               = undef,
  Optional[Boolean]                                                                         $kerberos_get_afs_token                = undef,
  Optional[Boolean]                                                                         $kerberos_or_local_passwd              = undef,
  Optional[Boolean]                                                                         $kerberos_ticket_cleanup               = undef,
  Optional[Boolean]                                                                         $kerberos_use_kuserok                  = undef,
  Optional[Array[String, 1]]                                                                $kex_algorithms                        = undef,
  Optional[Integer[0]]                                                                      $key_regeneration_interval             = undef,
  Optional[Array[Variant[Bodgitlib::Host, Tuple[Bodgitlib::Host, Bodgitlib::Port]], 1]]     $listen_address                        = undef,
  Optional[Integer[0]]                                                                      $login_grace_time                      = undef,
  Optional[String]                                                                          $log_level                             = undef,
  Optional[Array[String, 1]]                                                                $macs                                  = undef,
  Optional[Integer[0]]                                                                      $max_auth_tries                        = undef,
  Optional[Integer[0]]                                                                      $max_sessions                          = undef,
  Optional[Variant[Integer[0], Tuple[Integer[0], 3, 3]]]                                    $max_startups                          = undef,
  Optional[Boolean]                                                                         $password_authentication               = undef,
  Optional[Boolean]                                                                         $permit_empty_passwords                = undef,
  Optional[Variant[Enum['any', 'none'], Array[Tuple[Bodgitlib::Host, Bodgitlib::Port], 1]]] $permit_open                           = undef,
  Optional[Variant[Boolean, Enum['without-password', 'forced-commands-only']]]              $permit_root_login                     = undef,
  Optional[Boolean]                                                                         $permit_tty                            = undef,
  Optional[Variant[Boolean, Enum['point-to-point', 'ethernet']]]                            $permit_tunnel                         = undef,
  Optional[Boolean]                                                                         $permit_user_environment               = undef,
  Optional[Boolean]                                                                         $permit_user_rc                        = undef,
  Optional[Stdlib::Absolutepath]                                                            $pid_file                              = undef,
  Optional[Array[Bodgitlib::Port, 1]]                                                       $port                                  = undef,
  Optional[Boolean]                                                                         $print_last_log                        = undef,
  Optional[Boolean]                                                                         $print_motd                            = undef,
  Optional[Array[Integer[1, 2], 1, 2]]                                                      $protocol                              = undef,
  Optional[Boolean]                                                                         $pubkey_authentication                 = undef,
  Optional[OpenSSH::RekeyLimit]                                                             $rekey_limit                           = undef,
  Optional[Stdlib::Absolutepath]                                                            $revoked_keys                          = undef,
  Optional[Boolean]                                                                         $rhosts_rsa_authentication             = undef,
  Optional[Boolean]                                                                         $rsa_authentication                    = undef,
  Optional[Integer[0]]                                                                      $server_key_bits                       = undef,
  Optional[Boolean]                                                                         $show_patch_level                      = undef,
  Optional[Pattern[/(?x) ^ [0-7]{4} $/]]                                                    $stream_local_bind_mask                = undef,
  Optional[Boolean]                                                                         $stream_local_bind_unlink              = undef,
  Optional[Boolean]                                                                         $strict_modes                          = undef,
  Optional[String]                                                                          $syslog_facility                       = undef,
  Optional[Boolean]                                                                         $tcp_keepalive                         = undef,
  Optional[Stdlib::Absolutepath]                                                            $trusted_user_ca_keys                  = undef,
  Optional[Boolean]                                                                         $use_dns                               = undef,
  Optional[Boolean]                                                                         $use_login                             = undef,
  Optional[Boolean]                                                                         $use_pam                               = undef,
  Optional[Variant[Boolean, Enum['sandbox']]]                                               $use_privilege_separation              = undef,
  Optional[String]                                                                          $version_addendum                      = undef,
  Optional[Integer[0]]                                                                      $x11_display_offset                    = undef,
  Optional[Boolean]                                                                         $x11_forwarding                        = undef,
  Optional[Integer[0]]                                                                      $x11_max_displays                      = undef,
  Optional[Boolean]                                                                         $x11_use_localhost                     = undef,
  Optional[Stdlib::Absolutepath]                                                            $xauth_location                        = undef,
) {

  contain ::openssh::server::install
  contain ::openssh::server::config
  contain ::openssh::server::service

  Class['::openssh::server::install'] ~> Class['::openssh::server::config']
    ~> Class['::openssh::server::service']
}
