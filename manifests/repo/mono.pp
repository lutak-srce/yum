#
# = Class: yum::repo::mono
#
# This module manages Mono repo files for $operatingsystemrelease
#
class yum::repo::mono (
  $priority  = 99,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){

  exec {'monorepokeyimport':
    command => '/bin/rpm --import http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF',
    unless  => '/bin/rpm -q gpg-pubkey | /bin/grep -q d3d831ef-53dfa827',
  }

  file { '/etc/yum.repos.d/mono.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/mono.repo",
    require => Exec['monorepokeyimport'],
  }

}
