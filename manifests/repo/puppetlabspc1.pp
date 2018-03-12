#
# = Class: yum::repo::puppetlabls
#
# This module manages PuppetLabs repo files for $lsbdistrelease
#
class yum::repo::puppetlabspc1 (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source    = false,
  $devel     = false,
) {
  require yum::repo::base

  file { '/etc/yum.repos.d/puppetlabs-pc1.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/puppetlabs-pc1.erb"),
    require => Package['puppetlabs-release-pc1'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'puppetlabs-release-pc1' :
        provider => 'rpm',
        source   => 'https://yum.puppetlabs.com/puppetlabs-release-pc1-el-5.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'puppetlabs-release-pc1' :
        provider => 'rpm',
        source   => 'https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'puppetlabs-release-pc1' :
        provider => 'rpm',
        source   => 'https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm',
      }
    }
  }
}
