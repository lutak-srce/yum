# Class: yum::repo::puppetlabls
#
# This module manages PuppetLabs repo files for $lsbdistrelease
#
class yum::repo::puppetlabs (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source    = false,
  $devel     = false,
) {
  require yum::repo::base

  file { '/etc/yum.repos.d/puppetlabs.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/puppetlabs.erb"),
    require => Package['puppetlabs-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'puppetlabs-release' :
        provider => 'rpm',
        source   => 'http://yum.puppetlabs.com/el/5/products/x86_64/puppetlabs-release-5-11.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'puppetlabs-release' :
        provider => 'rpm',
        source   => 'http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-11.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'puppetlabs-release' :
        provider => 'rpm',
        source   => 'http://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm',
      }
    }
  }
}
