#
# = Class: yum::repo::nodejs_v9
#
class yum::repo::nodejs_v9 (
  $priority  = '2',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {

  require yum::repo::base

  file { '/etc/pki/rpm-gpg/NODESOURCE-GPG-SIGNING-KEY-EL':
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/yum/keys/NODESOURCE-GPG-SIGNING-KEY-EL',
  }

  file { '/etc/yum.repos.d/nodesource-el7.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/nodesource-el7.repo",
  }

}
