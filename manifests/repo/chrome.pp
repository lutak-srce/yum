# Class: yum::repo::chrome
#
# This module manages chrome repo files for $operatingsystemrelease
#
class yum::repo::chrome (
  $stage     = 'yumsetup',
  $priority  = 99,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  exec {'googlechromerepokeyimport':
    command => '/bin/rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub',
    unless  => '/bin/rpm -qa | /bin/grep -q 7fac5991-4615767f',
  }

  file { '/etc/yum.repos.d/google-chrome.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/google-chrome.repo",
    require => Exec['googlechromerepokeyimport'],
  }

}
