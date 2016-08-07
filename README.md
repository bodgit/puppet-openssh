# openssh

Tested with Travis CI

[![Build Status](https://travis-ci.org/bodgit/puppet-openssh.svg?branch=master)](https://travis-ci.org/bodgit/puppet-openssh)
[![Coverage Status](https://coveralls.io/repos/bodgit/puppet-openssh/badge.svg?branch=master&service=github)](https://coveralls.io/github/bodgit/puppet-openssh?branch=master)
[![Puppet Forge](http://img.shields.io/puppetforge/v/bodgit/openssh.svg)](https://forge.puppetlabs.com/bodgit/openssh)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with openssh](#setup)
    * [Beginning with openssh](#beginning-with-openssh)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module manages OpenSSH.

CentOS, RHEL, Scientific, Oracle Enterprise Linux and OpenBSD is supported
using Puppet 4.9.0 or later.

## Setup

### Beginning with openssh

The module defaults match those of the target OS so in the very simplest case, you can just include the following:

```puppet
include ::openssh::client
include ::openssh::server
```

## Usage

If you want to tune the security settings of the server:

```puppet
class { '::openssh::server':
  allow_groups                      => ['ssh-user'],
  challenge_response_authentication => false,
  ciphers                           => [
    'chacha20-poly1305@openssh.com',
    'aes256-gcm@openssh.com',
    'aes128-gcm@openssh.com',
    'aes256-ctr',
    'aes192-ctr',
    'aes128-ctr',
  ],
  host_key                          => [
    '/etc/ssh/ssh_host_ed25519_key',
    '/etc/ssh/ssh_host_rsa_key',
  ],
  kex_algorithms                    => [
    'curve25519-sha256@libssh.org',
    'diffie-hellman-group-exchange-sha256',
  ],
  macs                              => [
    'hmac-sha2-512-etm@openssh.com',
    'hmac-sha2-256-etm@openssh.com',
    'hmac-ripemd160-etm@openssh.com',
    'umac-128-etm@openssh.com',
    'hmac-sha2-512',
    'hmac-sha2-256',
    'hmac-ripemd160',
    'umac-128@openssh.com',
  ],
  password_authentication           => false,
  permit_root_login                 => false,
  pubkey_authentication             => true,
  protocol                          => [2],
}
```

Enabling SSH public key lookups from LDAP:

```puppet
class { '::openssh::server':
  authorized_keys_command      => '/usr/libexec/openssh/ssh-ldap-helper',
  authorized_keys_command_user => 'nobody',
}

class { '::openssh::server::ldap':
  base_dn => 'ou=people,dc=example,dc=com',
  uri     => [
    'ldap://ldap.example.com',
  ],
}
```

To add `Match ...` blocks to the server configuration:

```puppet
include ::openssh::server

::openssh::server::match { 'sftponly':
  group                => [
    'sftponly',
  ],
  chroot_directory     => '%h',
  force_command        => 'internal-sftp',
  allow_tcp_forwarding => false,
  x11_forwarding       => false,
}
```

To create a client configuration file and manage `Host ...` and `Match ...`
blocks within it:

```puppet
include ::openssh::client

::openssh::client::configuration { '/home/user/.ssh/config':
  owner => 'user',
  group => 'user',
  mode  => '0640',
}

::openssh::client::host { 'default':
  host          => '*',
  target        => '/home/user/.ssh/config',
  order         => 99,
  proxy_command => '/usr/bin/nc -X connect -x 192.0.2.0:8080 %h %p',
}

::openssh::client::match { 'catch-all':
  target        => '/home/user/.ssh/config',
  proxy_command => '/usr/bin/nc -X connect -x 192.0.2.0:8080 %h %p',
}
```

## Reference

The reference documentation is generated with
[puppet-strings](https://github.com/puppetlabs/puppet-strings) and the latest
version of the documentation is hosted at
[https://bodgit.github.io/puppet-openssh/](https://bodgit.github.io/puppet-openssh/).

## Limitations

This module has been built on and tested against Puppet 4.9.0 and higher.

The module has been tested on:

* Red Hat/CentOS Enterprise Linux 6/7
* OpenBSD 6.2/6.3

## Development

The module has both [rspec-puppet](http://rspec-puppet.com) and
[beaker-rspec](https://github.com/puppetlabs/beaker-rspec) tests. Run them
with:

```
$ bundle exec rake test
$ PUPPET_INSTALL_TYPE=agent PUPPET_INSTALL_VERSION=x.y.z bundle exec rake beaker:<nodeset>
```

Please log issues or pull requests at
[github](https://github.com/bodgit/puppet-openssh).
