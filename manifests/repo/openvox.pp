#
# = Class: yum::repo::openvox
#
# This module manages voxpupuli repo files for openvox
#
class yum::repo::openvox (
  $version  = '8',
  $priority = '1',
  $exclude  = [],
  $include  = [],
  $baseurl  = undef,
  $source   = false,
) {

  require yum::repo::base

  file { "/etc/yum.repos.d/openvox${version}-release.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/generic/openvox.erb'),
    require => Package["openvox${version}-release"],
  }

  package { "openvox${version}-release" :
    provider => 'rpm',
    source   => "https://yum.voxpupuli.org/openvox${version}-release-el-${facts['os']['release']['major']}.noarch.rpm",
  }

}
