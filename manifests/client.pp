# Installs and manages the OpenSSH client.
#
# @example Declaring the class
#   include ::openssh::client
#
# @param conf_dir
# @param conf_file
# @param manage_package
# @param package_name
# @param hosts
# @param matches
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
# @param enable_ssh_keysign
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
# @see puppet_classes::openssh::server ::openssh::server
class openssh::client (
  Stdlib::Absolutepath                      $conf_dir,
  Stdlib::Absolutepath                      $conf_file,
  Boolean                                   $manage_package,
  Optional[String]                          $package_name                         = undef,
  Optional[Hash[String, Hash[String, Any]]] $hosts                                = undef,
  Optional[Hash[String, Hash[String, Any]]] $matches                              = undef,
  # All of these are passed through to ::openssh::client::configuration
  Any                                       $add_keys_to_agent                    = undef,
  Any                                       $address_family                       = undef,
  Any                                       $batch_mode                           = undef,
  Any                                       $bind_address                         = undef,
  Any                                       $canonical_domains                    = undef,
  Any                                       $canonicalize_fallback_local          = undef,
  Any                                       $canonicalize_hostname                = undef,
  Any                                       $canonicalize_max_dots                = undef,
  Any                                       $canonicalize_permitted_cnames        = undef,
  Any                                       $certificate_file                     = undef,
  Any                                       $challenge_response_authentication    = undef,
  Any                                       $check_host_ip                        = undef,
  Any                                       $cipher                               = undef,
  Any                                       $ciphers                              = undef,
  Any                                       $clear_all_forwardings                = undef,
  Any                                       $compression                          = undef,
  Any                                       $compression_level                    = undef,
  Any                                       $connection_attempts                  = undef,
  Any                                       $connect_timeout                      = undef,
  Any                                       $control_master                       = undef,
  Any                                       $control_path                         = undef,
  Any                                       $control_persist                      = undef,
  Any                                       $dynamic_forward                      = undef,
  Any                                       $enable_ssh_keysign                   = undef,
  Any                                       $escape_char                          = undef,
  Any                                       $exit_on_forward_failure              = undef,
  Any                                       $fingerprint_hash                     = undef,
  Any                                       $forward_agent                        = undef,
  Any                                       $forward_x11                          = undef,
  Any                                       $forward_x11_timeout                  = undef,
  Any                                       $forward_x11_trusted                  = undef,
  Any                                       $gateway_ports                        = undef,
  Any                                       $global_known_hosts_file              = undef,
  Any                                       $gssapi_authentication                = undef,
  Any                                       $gssapi_client_identity               = undef,
  Any                                       $gssapi_delegate_credentials          = undef,
  Any                                       $gssapi_key_exchange                  = undef,
  Any                                       $gssapi_renewal_forces_rekey          = undef,
  Any                                       $gssapi_server_identity               = undef,
  Any                                       $gssapi_trust_dns                     = undef,
  Any                                       $gssapi_kex_algorithms                = undef,
  Any                                       $hash_known_hosts                     = undef,
  Any                                       $hostbased_authentication             = undef,
  Any                                       $hostbased_key_types                  = undef,
  Any                                       $host_key_algorithms                  = undef,
  Any                                       $host_key_alias                       = undef,
  Any                                       $host_name                            = undef,
  Any                                       $identities_only                      = undef,
  Any                                       $identity_agent                       = undef,
  Any                                       $identity_file                        = undef,
  Any                                       $ignore_unknown                       = undef,
  Any                                       $ip_qos                               = undef,
  Any                                       $kbd_interactive_authentication       = undef,
  Any                                       $kbd_interactive_devices              = undef,
  Any                                       $kex_algorithms                       = undef,
  Any                                       $local_command                        = undef,
  Any                                       $local_forward                        = undef,
  Any                                       $log_level                            = undef,
  Any                                       $macs                                 = undef,
  Any                                       $no_host_authentication_for_localhost = undef,
  Any                                       $number_of_password_prompts           = undef,
  Any                                       $password_authentication              = undef,
  Any                                       $permit_local_command                 = undef,
  Any                                       $pkcs11_provider                      = undef,
  Any                                       $port                                 = undef,
  Any                                       $preferred_authentications            = undef,
  Any                                       $protocol                             = undef,
  Any                                       $proxy_command                        = undef,
  Any                                       $proxy_jump                           = undef,
  Any                                       $proxy_use_fdpass                     = undef,
  Any                                       $pubkey_accepted_key_types            = undef,
  Any                                       $pubkey_authentication                = undef,
  Any                                       $rekey_limit                          = undef,
  Any                                       $remote_forward                       = undef,
  Any                                       $request_tty                          = undef,
  Any                                       $revoked_host_keys                    = undef,
  Any                                       $rhosts_rsa_authentication            = undef,
  Any                                       $rsa_authentication                   = undef,
  Any                                       $send_env                             = undef,
  Any                                       $server_alive_count_max               = undef,
  Any                                       $server_alive_interval                = undef,
  Any                                       $stream_local_bind_mask               = undef,
  Any                                       $stream_local_bind_unlink             = undef,
  Any                                       $strict_host_key_checking             = undef,
  Any                                       $tcp_keep_alive                       = undef,
  Any                                       $tunnel                               = undef,
  Any                                       $tunnel_device                        = undef,
  Any                                       $update_host_keys                     = undef,
  Any                                       $use_privileged_port                  = undef,
  Any                                       $user                                 = undef,
  Any                                       $user_known_hosts_file                = undef,
  Any                                       $verify_host_key_dns                  = undef,
  Any                                       $visual_host_key                      = undef,
  Any                                       $xauth_location                       = undef,
) {

  contain ::openssh::client::install
  contain ::openssh::client::config

  Class['::openssh::client::install'] -> Class['::openssh::client::config']
}
