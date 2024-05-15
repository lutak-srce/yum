#
# = Class: yum::repo::puppet
#
# This module manages PuppetLabs repo files for $lsbdistrelease
#
class yum::repo::puppet (
  $version  = '6',
  $priority = '1',
  $exclude  = [],
  $include  = [],
  $baseurl  = undef,
  $source   = false,
) {

  require yum::repo::base

  $puppet_repo_file = Integer($version) ? {
    7       => "puppet${version}-release.repo",
    default => "puppet${version}.repo"
  }

  file { "/etc/yum.repos.d/${puppet_repo_file}":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/generic/puppet.erb"),
    require => Package["puppet${version}-release"],
  }

  package { "puppet${version}-release" :
    provider => 'rpm',
    source   => "https://yum.puppetlabs.com/puppet${version}-release-el-${facts['os']['release']['major']}.noarch.rpm",
  }

}
