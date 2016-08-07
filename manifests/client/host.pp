# Declare a client host block
#
# @example Declaring a default host block
#   include ::openssh::client
#   ::openssh::client::configuration { '/home/user/.ssh/config':
#     owner => 'user',
#     group => 'user',
#     mode  => '0640',
#   }
#   ::openssh::client::host { 'default':
#     host          => '*',
#     target        => '/home/user/.ssh/config',
#     order         => 99,
#     proxy_command => '/usr/bin/nc -X connect -x 192.0.2.0:8080 %h %p',
#   }
#
# @param host
# @param target
# @param order
# @param add_keys_to_agent
# @param address_family
# @param batch_mode
# @param bind_address
# @param canonical_domains
# @param canonicalize_fallback_local
# @param canonicalize_hostname
# @param canonicalize_max_dots
# @param canonicalize_permitted_cnames
# @param certificate_file
# @param challenge_response_authentication
# @param check_host_ip
# @param cipher
# @param ciphers
# @param clear_all_forwardings
# @param compression
# @param compression_level
# @param connection_attempts
# @param connect_timeout
# @param control_master
# @param control_path
# @param control_persist
# @param dynamic_forward
# @param escape_char
# @param exit_on_forward_failure
# @param fingerprint_hash
# @param forward_agent
# @param forward_x11
# @param forward_x11_timeout
# @param forward_x11_trusted
# @param gateway_ports
# @param global_known_hosts_file
# @param gssapi_authentication
# @param gssapi_client_identity
# @param gssapi_delegate_credentials
# @param gssapi_key_exchange
# @param gssapi_renewal_forces_rekey
# @param gssapi_server_identity
# @param gssapi_trust_dns
# @param gssapi_kex_algorithms
# @param hash_known_hosts
# @param hostbased_authentication
# @param hostbased_key_types
# @param host_key_algorithms
# @param host_key_alias
# @param host_name
# @param identities_only
# @param identity_agent
# @param identity_file
# @param ignore_unknown
# @param ip_qos
# @param kbd_interactive_authentication
# @param kbd_interactive_devices
# @param kex_algorithms
# @param local_command
# @param local_forward
# @param log_level
# @param macs
# @param no_host_authentication_for_localhost
# @param number_of_password_prompts
# @param password_authentication
# @param permit_local_command
# @param pkcs11_provider
# @param port
# @param preferred_authentications
# @param protocol
# @param proxy_command
# @param proxy_jump
# @param proxy_use_fdpass
# @param pubkey_accepted_key_types
# @param pubkey_authentication
# @param rekey_limit
# @param remote_forward
# @param request_tty
# @param revoked_host_keys
# @param rhosts_rsa_authentication
# @param rsa_authentication
# @param send_env
# @param server_alive_count_max
# @param server_alive_interval
# @param stream_local_bind_mask
# @param stream_local_bind_unlink
# @param strict_host_key_checking
# @param tcp_keep_alive
# @param tunnel
# @param tunnel_device
# @param update_host_keys
# @param use_privileged_port
# @param user
# @param user_known_hosts_file
# @param verify_host_key_dns
# @param visual_host_key
# @param xauth_location
#
# @see puppet_classes::openssh::client ::openssh::client
# @see puppet_defined_types::openssh::client::configuration ::openssh::client::configuration
# @see puppet_defined_types::openssh::client::match ::openssh::client::match
define openssh::client::host (
  String                                                                                    $host,
  Stdlib::Absolutepath                                                                      $target,
  Variant[Integer[0], String]                                                               $order                                = 10,
  # ssh_config settings below
  Optional[Variant[Boolean, Enum['ask', 'confirm']]]                                        $add_keys_to_agent                    = undef,
  Optional[Enum['any', 'inet', 'inet6']]                                                    $address_family                       = undef,
  Optional[Boolean]                                                                         $batch_mode                           = undef,
  Optional[IP::Address::NoSubnet]                                                           $bind_address                         = undef,
  Optional[Array[Bodgitlib::Domain, 1]]                                                     $canonical_domains                    = undef,
  Optional[Boolean]                                                                         $canonicalize_fallback_local          = undef,
  Optional[Variant[Boolean, Enum['always']]]                                                $canonicalize_hostname                = undef,
  Optional[Integer[0]]                                                                      $canonicalize_max_dots                = undef,
  Optional[Array[Tuple[Array[String, 1], Array[String, 1]], 1]]                             $canonicalize_permitted_cnames        = undef,
  Optional[Array[String, 1]]                                                                $certificate_file                     = undef,
  Optional[Boolean]                                                                         $challenge_response_authentication    = undef,
  Optional[Boolean]                                                                         $check_host_ip                        = undef,
  Optional[Enum['blowfish', '3des', 'des']]                                                 $cipher                               = undef,
  Optional[Array[String, 1]]                                                                $ciphers                              = undef,
  Optional[Boolean]                                                                         $clear_all_forwardings                = undef,
  Optional[Boolean]                                                                         $compression                          = undef,
  Optional[Integer[1, 9]]                                                                   $compression_level                    = undef,
  Optional[Integer[1]]                                                                      $connection_attempts                  = undef,
  Optional[Integer[0]]                                                                      $connect_timeout                      = undef,
  Optional[Variant[Boolean, Enum['ask', 'auto', 'autoask']]]                                $control_master                       = undef,
  Optional[String]                                                                          $control_path                         = undef,
  Optional[Boolean]                                                                         $control_persist                      = undef,
  Optional[Array[OpenSSH::Forward::Dynamic, 1]]                                             $dynamic_forward                      = undef,
  Optional[Variant[String[1, 1], Pattern[/(?x) ^ \^ [a-zA-Z] $ /], Enum['none']]]           $escape_char                          = undef,
  Optional[Boolean]                                                                         $exit_on_forward_failure              = undef,
  Optional[Array[Enum['md5', 'sha256'], 1]]                                                 $fingerprint_hash                     = undef,
  Optional[Boolean]                                                                         $forward_agent                        = undef,
  Optional[Boolean]                                                                         $forward_x11                          = undef,
  Optional[OpenSSH::TimeFormat]                                                             $forward_x11_timeout                  = undef,
  Optional[Boolean]                                                                         $forward_x11_trusted                  = undef,
  Optional[Boolean]                                                                         $gateway_ports                        = undef,
  Optional[Array[Stdlib::Absolutepath, 1]]                                                  $global_known_hosts_file              = undef,
  Optional[Boolean]                                                                         $gssapi_authentication                = undef,
  Optional[String]                                                                          $gssapi_client_identity               = undef,
  Optional[Boolean]                                                                         $gssapi_delegate_credentials          = undef,
  Optional[Boolean]                                                                         $gssapi_key_exchange                  = undef,
  Optional[Boolean]                                                                         $gssapi_renewal_forces_rekey          = undef,
  Optional[String]                                                                          $gssapi_server_identity               = undef,
  Optional[Boolean]                                                                         $gssapi_trust_dns                     = undef,
  Optional[Array[String, 1]]                                                                $gssapi_kex_algorithms                = undef,
  Optional[Boolean]                                                                         $hash_known_hosts                     = undef,
  Optional[Boolean]                                                                         $hostbased_authentication             = undef,
  Optional[Array[String, 1]]                                                                $hostbased_key_types                  = undef,
  Optional[Array[String, 1]]                                                                $host_key_algorithms                  = undef,
  Optional[String]                                                                          $host_key_alias                       = undef,
  Optional[String]                                                                          $host_name                            = undef,
  Optional[Boolean]                                                                         $identities_only                      = undef,
  Optional[String]                                                                          $identity_agent                       = undef,
  Optional[Array[String, 1]]                                                                $identity_file                        = undef,
  Optional[Array[String, 1]]                                                                $ignore_unknown                       = undef,
  Optional[Tuple[OpenSSH::QoS, 1, 2]]                                                       $ip_qos                               = undef,
  Optional[Boolean]                                                                         $kbd_interactive_authentication       = undef,
  Optional[Array[Enum['bsdauth', 'pam', 'skey'], 1]]                                        $kbd_interactive_devices              = undef,
  Optional[Array[String, 1]]                                                                $kex_algorithms                       = undef,
  Optional[String]                                                                          $local_command                        = undef,
  Optional[Array[OpenSSH::Forward::Local, 1]]                                               $local_forward                        = undef,
  Optional[String]                                                                          $log_level                            = undef,
  Optional[Array[String, 1]]                                                                $macs                                 = undef,
  Optional[Boolean]                                                                         $no_host_authentication_for_localhost = undef,
  Optional[Integer[1]]                                                                      $number_of_password_prompts           = undef,
  Optional[Boolean]                                                                         $password_authentication              = undef,
  Optional[Boolean]                                                                         $permit_local_command                 = undef,
  Optional[String]                                                                          $pkcs11_provider                      = undef,
  Optional[Bodgitlib::Port]                                                                 $port                                 = undef,
  Optional[Array[String, 1]]                                                                $preferred_authentications            = undef,
  Optional[Array[Integer[1, 2], 1, 2]]                                                      $protocol                             = undef,
  Optional[String]                                                                          $proxy_command                        = undef,
  Optional[Array[OpenSSH::Proxy, 1]]                                                        $proxy_jump                           = undef,
  Optional[Boolean]                                                                         $proxy_use_fdpass                     = undef,
  Optional[Array[String, 1]]                                                                $pubkey_accepted_key_types            = undef,
  Optional[Boolean]                                                                         $pubkey_authentication                = undef,
  Optional[OpenSSH::RekeyLimit]                                                             $rekey_limit                          = undef,
  Optional[Array[OpenSSH::Forward::Remote, 1]]                                              $remote_forward                       = undef,
  Optional[Variant[Boolean, Enum['auto', 'force']]]                                         $request_tty                          = undef,
  Optional[Stdlib::Absolutepath]                                                            $revoked_host_keys                    = undef,
  Optional[Boolean]                                                                         $rhosts_rsa_authentication            = undef,
  Optional[Boolean]                                                                         $rsa_authentication                   = undef,
  Optional[Array[String, 1]]                                                                $send_env                             = undef,
  Optional[Integer[0]]                                                                      $server_alive_count_max               = undef,
  Optional[Integer[0]]                                                                      $server_alive_interval                = undef,
  Optional[Pattern[/(?x) ^ [0-7]{4} $ /]]                                                   $stream_local_bind_mask               = undef,
  Optional[Boolean]                                                                         $stream_local_bind_unlink             = undef,
  Optional[Variant[Boolean, Enum['ask']]]                                                   $strict_host_key_checking             = undef,
  Optional[Boolean]                                                                         $tcp_keep_alive                       = undef,
  Optional[Variant[Boolean, Enum['ethernet', 'point-to-point']]]                            $tunnel                               = undef,
  Optional[Variant[Integer[0], Enum['any'], Tuple[Variant[Integer[0], Enum['any']], 2, 2]]] $tunnel_device                        = undef,
  Optional[Variant[Boolean, Enum['ask']]]                                                   $update_host_keys                     = undef,
  Optional[Boolean]                                                                         $use_privileged_port                  = undef,
  Optional[String]                                                                          $user                                 = undef,
  Optional[Array[String, 1]]                                                                $user_known_hosts_file                = undef,
  Optional[Variant[Boolean, Enum['ask']]]                                                   $verify_host_key_dns                  = undef,
  Optional[Boolean]                                                                         $visual_host_key                      = undef,
  Optional[Stdlib::Absolutepath]                                                            $xauth_location                       = undef,
) {

  if ! defined(Class['::openssh::client']) {
    fail('You must include the openssh::client base class before using any openssh::client defined resources')
  }

  $_dynamic_forward = $dynamic_forward ? {
    undef   => undef,
    default => $dynamic_forward.map |$x| {
      type($x) ? {
        Type[Tuple] => [bodgitlib::enclose_ipv6($x[0]), $x[1]],
        default     => $x,
      }
    },
  }

  $_local_forward = $local_forward ? {
    undef   => undef,
    default => $local_forward.map |$x| {
      type($x[0]) ? {
        Type[Tuple] => [[bodgitlib::enclose_ipv6($x[0][0]), $x[0][1]], [bodgitlib::enclose_ipv6($x[1][0]), $x[1][1]]],
        default     => [$x[0], [bodgitlib::enclose_ipv6($x[1][0]), $x[1][1]]],
      }
    },
  }

  $_proxy_jump = $proxy_jump ? {
    undef   => undef,
    default => $proxy_jump.map |$x| {
      type($x) ? {
        Type[Tuple] => type($x[1]) ? {
          Type[Integer] => sprintf('%s:%d', bodgitlib::enclose_ipv6($x[0]), $x[1]),
          default       => length($x) ? {
            2 => sprintf('%s@%s', $x[0], bodgitlib::enclose_ipv6($x[1])),
            3 => sprintf('%s@%s:%d', $x[0], bodgitlib::enclose_ipv6($x[1]), $x[2]),
          },
        },
        default     => $x, # XXX bodgitlib::enclose_ipv6($x) instead?
      }
    },
  }

  $_remote_forward = $remote_forward ? {
    undef   => undef,
    default => $remote_forward.map |$x| {
      type($x[0]) ? {
        Type[Tuple] => [[bodgitlib::enclose_ipv6($x[0][0]), $x[0][1]], [bodgitlib::enclose_ipv6($x[1][0]), $x[1][1]]],
        default     => [$x[0], [bodgitlib::enclose_ipv6($x[1][0]), $x[1][1]]],
      }
    },
  }

  $content = template("${module_name}/client/host.erb")

  # Only include a fragment if there some actual settings applied. If the last
  # line of the fragment is the 'Host ...' header, there are none
  if split($content, '\n')[-1] !~ /^Host / {
    ::concat::fragment { "${module_name} client ${target} host ${host}":
      target  => $target,
      order   => "20-${order}",
      content => $content,
    }
  }
}
