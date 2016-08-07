# Declare a SSH server match block
#
# @example Declaring an SFTP-only group
#   include ::openssh::server
#   ::openssh::server::match { 'sftponly':
#     group                => ['sftponly'],
#     chroot_directory     => '%h',
#     force_command        => 'internal-sftp',
#     allow_tcp_forwarding => false,
#     x11_forwarding       => false,
#   }
#
# @param user
# @param group
# @param host
# @param local_address
# @param local_port
# @param address
# @param order
# @param accept_env
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
# @param chroot_directory
# @param client_alive_count_max
# @param client_alive_interval
# @param deny_groups
# @param deny_users
# @param force_command
# @param gateway_ports
# @param gssapi_authentication
# @param hostbased_accepted_key_types
# @param hostbased_authentication
# @param hostbased_uses_name_from_packet_only
# @param ip_qos
# @param kbd_interactive_authentication
# @param kerberos_authentication
# @param kerberos_use_kuserok
# @param max_auth_tries
# @param max_sessions
# @param password_authentication
# @param permit_empty_passwords
# @param permit_open
# @param permit_root_login
# @param permit_tty
# @param permit_tunnel
# @param permit_user_rc
# @param pubkey_authentication
# @param rekey_limit
# @param revoked_keys
# @param stream_local_bind_mask
# @param stream_local_bind_unlink
# @param trusted_user_ca_keys
# @param x11_display_offset
# @param x11_forwarding
# @param x11_max_displays
# @param x11_use_localhost
#
# @see puppet_classes::openssh::server ::openssh::server
define openssh::server::match (
  Optional[Array[String, 1]]                                                   $user                                 = undef,
  Optional[Array[String, 1]]                                                   $group                                = undef,
  Optional[Array[String, 1]]                                                   $host                                 = undef,
  Optional[Array[String, 1]]                                                   $local_address                        = undef,
  Optional[Array[String, 1]]                                                   $local_port                           = undef,
  Optional[Array[String, 1]]                                                   $address                              = undef,
  Variant[String, Integer[0]]                                                  $order                                = 10,
  # sshd_config settings below
  Optional[Array[String, 1]]                                                   $accept_env                           = undef,
  Optional[Boolean]                                                            $allow_agent_forwarding               = undef,
  Optional[Array[String, 1]]                                                   $allow_groups                         = undef,
  Optional[Variant[Boolean, Enum['all', 'local', 'remote']]]                   $allow_stream_local_forwarding        = undef,
  Optional[Variant[Boolean, Enum['all', 'local', 'remote']]]                   $allow_tcp_forwarding                 = undef,
  Optional[Array[String, 1]]                                                   $allow_users                          = undef,
  Optional[Array[Array[String, 1], 1]]                                         $authentication_methods               = undef,
  Optional[String]                                                             $authorized_keys_command              = undef,
  Optional[String]                                                             $authorized_keys_command_user         = undef,
  Optional[String]                                                             $authorized_keys_command_run_as       = undef,
  Optional[String]                                                             $authorized_keys_file                 = undef,
  Optional[String]                                                             $authorized_principals_command        = undef,
  Optional[String]                                                             $authorized_principals_command_user   = undef,
  Optional[String]                                                             $authorized_principals_file           = undef,
  Optional[Stdlib::Absolutepath]                                               $banner                               = undef,
  Optional[String]                                                             $chroot_directory                     = undef,
  Optional[Integer[0]]                                                         $client_alive_count_max               = undef,
  Optional[Integer[0]]                                                         $client_alive_interval                = undef,
  Optional[Array[String, 1]]                                                   $deny_groups                          = undef,
  Optional[Array[String, 1]]                                                   $deny_users                           = undef,
  Optional[String]                                                             $force_command                        = undef,
  Optional[Variant[Boolean, Enum['clientspecified']]]                          $gateway_ports                        = undef,
  Optional[Boolean]                                                            $gssapi_authentication                = undef,
  Optional[Array[String, 1]]                                                   $hostbased_accepted_key_types         = undef,
  Optional[Boolean]                                                            $hostbased_authentication             = undef,
  Optional[Boolean]                                                            $hostbased_uses_name_from_packet_only = undef,
  Optional[Tuple[OpenSSH::QoS, 1, 2]]                                          $ip_qos                               = undef,
  Optional[Boolean]                                                            $kbd_interactive_authentication       = undef,
  Optional[Boolean]                                                            $kerberos_authentication              = undef,
  Optional[Boolean]                                                            $kerberos_use_kuserok                 = undef,
  Optional[Integer[0]]                                                         $max_auth_tries                       = undef,
  Optional[Integer[0]]                                                         $max_sessions                         = undef,
  Optional[Boolean]                                                            $password_authentication              = undef,
  Optional[Boolean]                                                            $permit_empty_passwords               = undef,
  Optional[Variant[Enum['any', 'none'], Array[OpenSSH::PermitOpen, 1]]]        $permit_open                          = undef,
  Optional[Variant[Boolean, Enum['without-password', 'forced-commands-only']]] $permit_root_login                    = undef,
  Optional[Boolean]                                                            $permit_tty                           = undef,
  Optional[Variant[Boolean, Enum['point-to-point', 'ethernet']]]               $permit_tunnel                        = undef,
  Optional[Boolean]                                                            $permit_user_rc                       = undef,
  Optional[Boolean]                                                            $pubkey_authentication                = undef,
  Optional[OpenSSH::RekeyLimit]                                                $rekey_limit                          = undef,
  Optional[Stdlib::Absolutepath]                                               $revoked_keys                         = undef,
  Optional[Pattern[/(?x) ^ [0-7]{4} $/]]                                       $stream_local_bind_mask               = undef,
  Optional[Boolean]                                                            $stream_local_bind_unlink             = undef,
  Optional[Stdlib::Absolutepath]                                               $trusted_user_ca_keys                 = undef,
  Optional[Integer[0]]                                                         $x11_display_offset                   = undef,
  Optional[Boolean]                                                            $x11_forwarding                       = undef,
  Optional[Integer[0]]                                                         $x11_max_displays                     = undef,
  Optional[Boolean]                                                            $x11_use_localhost                    = undef,
) {

  if ! defined(Class['::openssh::server']) {
    fail('You must include the openssh::server base class before using any openssh::server defined resources')
  }

  $_permit_open = $permit_open ? {
    undef   => undef,
    default => type($permit_open) ? {
      Type[String] => $permit_open,
      default      => $permit_open.map |$x| { [bodgitlib::enclose_ipv6($x[0]), $x[1]] },
    },
  }

  $content = template("${module_name}/server/match.erb")

  # Only include a fragment if there some actual settings applied. If the last
  # line of the fragment is the 'Match ...' header, there are none
  if split($content, '\n')[-1] !~ /^Match / {
    ::concat::fragment { "${module_name} server match ${title}":
      target  => $::openssh::server::conf_file,
      order   => "30-${order}",
      content => $content,
    }
  }
}
