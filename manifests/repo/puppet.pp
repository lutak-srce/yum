#
# = Class: yum::repo::puppet
#
# This module manages PuppetLabs repo files for $lsbdistrelease
#
class yum::repo::puppet (
  $version  = '5',
  $priority = '1',
  $exclude  = [],
  $include  = [],
  $baseurl  = undef,
  $source   = false,
) {

  require yum::repo::base

  file { "/etc/yum.repos.d/puppet${version}.repo" :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/puppet.erb"),
    require => Package["puppet${version}-release"],
  }

  package { "puppet${version}-release" :
    provider => 'rpm',
    source   => "https://yum.puppetlabs.com/puppet${version}-release-el-${facts['os']['release']['major']}.noarch.rpm",
  }

}
