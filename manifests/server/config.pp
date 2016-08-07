# @!visibility private
class openssh::server::config {

  $accept_env                           = $::openssh::server::accept_env
  $address_family                       = $::openssh::server::address_family
  $allow_agent_forwarding               = $::openssh::server::allow_agent_forwarding
  $allow_groups                         = $::openssh::server::allow_groups
  $allow_stream_local_forwarding        = $::openssh::server::allow_stream_local_forwarding
  $allow_tcp_forwarding                 = $::openssh::server::allow_tcp_forwarding
  $allow_users                          = $::openssh::server::allow_users
  $authentication_methods               = $::openssh::server::authentication_methods
  $authorized_keys_command              = $::openssh::server::authorized_keys_command
  $authorized_keys_command_run_as       = $::openssh::server::authorized_keys_command_run_as
  $authorized_keys_command_user         = $::openssh::server::authorized_keys_command_user
  $authorized_keys_file                 = $::openssh::server::authorized_keys_file
  $authorized_principals_command        = $::openssh::server::authorized_principals_command
  $authorized_principals_command_user   = $::openssh::server::authorized_principals_command_user
  $authorized_principals_file           = $::openssh::server::authorized_principals_file
  $banner                               = $::openssh::server::banner
  $challenge_response_authentication    = $::openssh::server::challenge_response_authentication
  $chroot_directory                     = $::openssh::server::chroot_directory
  $ciphers                              = $::openssh::server::ciphers
  $client_alive_count_max               = $::openssh::server::client_alive_count_max
  $client_alive_interval                = $::openssh::server::client_alive_interval
  $compression                          = $::openssh::server::compression
  $deny_groups                          = $::openssh::server::deny_groups
  $deny_users                           = $::openssh::server::deny_users
  $disable_forwarding                   = $::openssh::server::disable_forwarding
  $expose_authentication_methods        = $::openssh::server::expose_authentication_methods
  $fingerprint_hash                     = $::openssh::server::fingerprint_hash
  $force_command                        = $::openssh::server::force_command
  $gateway_ports                        = $::openssh::server::gateway_ports
  $gssapi_authentication                = $::openssh::server::gssapi_authentication
  $gssapi_cleanup_credentials           = $::openssh::server::gssapi_cleanup_credentials
  $gssapi_key_exchange                  = $::openssh::server::gssapi_key_exchange
  $gssapi_enable_k5users                = $::openssh::server::gssapi_enable_k5users
  $gssapi_strict_acceptor_check         = $::openssh::server::gssapi_strict_acceptor_check
  $gssapi_store_credentials_on_rekey    = $::openssh::server::gssapi_store_credentials_on_rekey
  $gssapi_kex_algorithms                = $::openssh::server::gssapi_kex_algorithms
  $hostbased_accepted_key_types         = $::openssh::server::hostbased_accepted_key_types
  $hostbased_authentication             = $::openssh::server::hostbased_authentication
  $hostbased_uses_name_from_packet_only = $::openssh::server::hostbased_uses_name_from_packet_only
  $host_certificate                     = $::openssh::server::host_certificate
  $host_key                             = $::openssh::server::host_key
  $host_key_agent                       = $::openssh::server::host_key_agent
  $host_key_algorithms                  = $::openssh::server::host_key_algorithms
  $ignore_rhosts                        = $::openssh::server::ignore_rhosts
  $ignore_user_known_hosts              = $::openssh::server::ignore_user_known_hosts
  $ip_qos                               = $::openssh::server::ip_qos
  $kbd_interactive_authentication       = $::openssh::server::kbd_interactive_authentication
  $kerberos_authentication              = $::openssh::server::kerberos_authentication
  $kerberos_get_afs_token               = $::openssh::server::kerberos_get_afs_token
  $kerberos_or_local_passwd             = $::openssh::server::kerberos_or_local_passwd
  $kerberos_ticket_cleanup              = $::openssh::server::kerberos_ticket_cleanup
  $kerberos_use_kuserok                 = $::openssh::server::kerberos_use_kuserok
  $kex_algorithms                       = $::openssh::server::kex_algorithms
  $key_regeneration_interval            = $::openssh::server::key_regeneration_interval
  $listen_address                       = $::openssh::server::listen_address ? {
    undef   => undef,
    default => $::openssh::server::listen_address.map |$address| {
      type($address) ? {
        Type[Tuple] => join([bodgitlib::enclose_ipv6($address[0]), $address[1]], ':'),
        default     => $address,
      }
    },
  }
  $login_grace_time                     = $::openssh::server::login_grace_time
  $log_level                            = $::openssh::server::log_level
  $macs                                 = $::openssh::server::macs
  $max_auth_tries                       = $::openssh::server::max_auth_tries
  $max_sessions                         = $::openssh::server::max_sessions
  $max_startups                         = $::openssh::server::max_startups
  $password_authentication              = $::openssh::server::password_authentication
  $permit_empty_passwords               = $::openssh::server::permit_empty_passwords
  $permit_open                          = $::openssh::server::permit_open
  $permit_root_login                    = $::openssh::server::permit_root_login
  $permit_tty                           = $::openssh::server::permit_tty
  $permit_tunnel                        = $::openssh::server::permit_tunnel
  $permit_user_environment              = $::openssh::server::permit_user_environment
  $permit_user_rc                       = $::openssh::server::permit_user_rc
  $pid_file                             = $::openssh::server::pid_file
  $port                                 = $::openssh::server::port
  $print_last_log                       = $::openssh::server::print_last_log
  $print_motd                           = $::openssh::server::print_motd
  $protocol                             = $::openssh::server::protocol
  $pubkey_authentication                = $::openssh::server::pubkey_authentication
  $rekey_limit                          = $::openssh::server::rekey_limit
  $revoked_keys                         = $::openssh::server::revoked_keys
  $rhosts_rsa_authentication            = $::openssh::server::rhosts_rsa_authentication
  $rsa_authentication                   = $::openssh::server::rsa_authentication
  $server_key_bits                      = $::openssh::server::server_key_bits
  $show_patch_level                     = $::openssh::server::show_patch_level
  $stream_local_bind_mask               = $::openssh::server::stream_local_bind_mask
  $stream_local_bind_unlink             = $::openssh::server::stream_local_bind_unlink
  $strict_modes                         = $::openssh::server::strict_modes
  $syslog_facility                      = $::openssh::server::syslog_facility
  $tcp_keepalive                        = $::openssh::server::tcp_keepalive
  $trusted_user_ca_keys                 = $::openssh::server::trusted_user_ca_keys
  $use_dns                              = $::openssh::server::use_dns
  $use_login                            = $::openssh::server::use_login
  $use_pam                              = $::openssh::server::use_pam
  $use_privilege_separation             = $::openssh::server::use_privilege_separation
  $version_addendum                     = $::openssh::server::version_addendum
  $x11_display_offset                   = $::openssh::server::x11_display_offset
  $x11_forwarding                       = $::openssh::server::x11_forwarding
  $x11_max_displays                     = $::openssh::server::x11_max_displays
  $x11_use_localhost                    = $::openssh::server::x11_use_localhost
  $xauth_location                       = $::openssh::server::xauth_location

  ensure_resource('file', $::openssh::server::conf_dir, {
    ensure => directory,
    owner  => 0,
    group  => 0,
    mode   => '0644',
  })

  ::concat { $::openssh::server::conf_file:
    owner        => 0,
    group        => 0,
    mode         => '0600',
    warn         => "# !!! Managed by Puppet !!!\n",
    validate_cmd => 'sshd -t -f %',
  }

  ::concat::fragment { "${module_name} server config":
    target  => $::openssh::server::conf_file,
    order   => 10,
    content => template("${module_name}/server/config.erb"),
  }

  $::openssh::server::matches.each |$resource, $attributes| {
    ::openssh::server::match { $resource:
      * => $attributes,
    }
  }
}
