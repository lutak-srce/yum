# Class: yum::repo::epel
#
# This module manages EPEL repo files for $lsbdistrelease
#
class yum::repo::epel (
  $stage     = 'yumsetup',
  $priority  = '11',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source    = false,
) {
  file { '/etc/yum.repos.d/epel.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/epel.erb"),
    require => Package['epel-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'epel-release':
        ensure   => present,
        provider => 'rpm',
        source   =>  'http://mirror.bytemark.co.uk/fedora/epel/5/i386/epel-release-5-4.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'epel-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://ftp-stud.hs-esslingen.de/pub/epel/6/i386/epel-release-6-8.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'epel-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://ftp.icm.edu.pl/pub/Linux/fedora/linux/epel/7/x86_64/e/epel-release-7-5.noarch.rpm'
      }
    }
  }
}
