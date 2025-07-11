#
# = Class: yum::repo::wandisco
#
# This module manages Wandisco repo files for $lsbdistrelease
# Repo serves newer SVN releases
#
class yum::repo::wandisco (
  $priority  = '1',
  $version   = '1.9',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require yum::repo::base

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-WANdisco':
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/yum/keys/RPM-GPG-KEY-WANdisco',
  }
  file { "/etc/yum.repos.d/WANdisco-${version}.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/wandisco.erb"),
    require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-WANdisco'],
  }
}
