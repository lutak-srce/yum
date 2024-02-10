#
# = Class: yum::repo::zfs
#
# This class manages ZFS repo files for $lsbdistrelease
#
class yum::repo::zfs (
  $priority     = '99',
  $exclude      = [],
  $include      = [],
  $baseurl      = undef,
  $baseurl_kmod = undef,
  $debuginfo    = false,
  $source       = false,
  $kmod         = false,
) {
  require ::yum::repo::epel

  file { '/etc/yum.repos.d/zfs.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/zfs.erb"),
    require => Package['zfs-release'],
  }

  package { 'zfs-release':
    ensure   => present,
    provider => 'rpm',
    source   => "https://zfsonlinux.org/epel/zfs-release-2-3.el${facts['os']['release']['major']}.noarch.rpm",
  }

}
