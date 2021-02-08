#
# = Class: yum::repo::zulu
#
# This module manages Zulu repo files for $lsbdistrelease
#
class yum::repo::zulu (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
  $source    = false,
) {

  exec {'zulurepokeyimport':
    command => '/bin/rpm --import http://repos.azulsystems.com/RPM-GPG-KEY-azulsystems',
    unless  => '/bin/rpm -qa | /bin/grep -q gpg-pubkey-219bd9c9-536015af',
  }

  file { '/etc/yum.repos.d/zulu.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/CentOS/zulu.erb'),
    require => Exec['zulurepokeyimport'],
  }

}
