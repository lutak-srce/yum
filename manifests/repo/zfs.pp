#
# = Class: yum::repo::zfs
#
# This class manages ZFS repo files for $lsbdistrelease
#
class yum::repo::zfs (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
  $source    = false,
  $kmod      = false,
) {
  require ::yum::repo::epel

  file { '/etc/yum.repos.d/zfs.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/zfs.erb"),
    require => Package['zfs-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'zfs-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://download.zfsonlinux.org/epel/zfs-release.el6.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'zfs-release':
        ensure   => present,
        provider => 'rpm',
        source   => "http://download.zfsonlinux.org/epel/zfs-release.el7_${facts['os']['release']['minor']}.noarch.rpm",
      }
    }
    /^8.*/: {
      package { 'zfs-release':
        ensure   => present,
        provider => 'rpm',
        source   => "http://download.zfsonlinux.org/epel/zfs-release.el8_${facts['os']['release']['minor']}.noarch.rpm",
      }
    }
    /^9.*/: {
      package { 'zfs-release':
        ensure   => present,
        provider => 'rpm',
        source   => "https://zfsonlinux.org/epel/zfs-release-2-2.el9.noarch.rpm",
      }
    }
  }
}
