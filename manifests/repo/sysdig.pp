# Class: yum::repo::sysdig
#
# This module manages SysDig repo files for $lsbdistrelease
#
class yum::repo::sysdig (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source    = false,
) {

  exec {'sysdigrepokeyimport':
    command => '/bin/rpm --import https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public',
    unless  => '/bin/rpm -qa | /bin/grep -q gpg-pubkey-ec51e8c4-52314537',
  }

  file { '/etc/yum.repos.d/sysdig.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => 'puppet:///modules/yum/sysdig.repo',
    require => Exec['sysdigrepokeyimport'],
  }

}
