#
# = Class: yum::repo::puppetlabls
#
# This module manages PuppetLabs repo files for $lsbdistrelease
#
class yum::repo::puppetlabspc1 (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $source    = false,
  $baseurl   = undef,
) {
  require yum::repo::base

  file { '/etc/yum.repos.d/puppetlabs-pc1.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/puppetlabs-pc1.erb"),
    require => Package['puppetlabs-release-pc1'],
  }

  # install package depending on major version
  case $facts['os']['release']['full'] {
    default: {}
    /^5.*/: {
      package { 'puppetlabs-release-pc1' :
        provider => 'rpm',
        source   => 'https://yum.puppetlabs.com/el/5/PC1/x86_64/puppetlabs-release-pc1-1.1.0-5.el5.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'puppetlabs-release-pc1' :
        provider => 'rpm',
        source   => 'https://yum.puppetlabs.com/el/6/PC1/x86_64/puppetlabs-release-pc1-1.1.0-5.el6.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'puppetlabs-release-pc1' :
        provider => 'rpm',
        source   => 'https://yum.puppetlabs.com/el/7/PC1/x86_64/puppetlabs-release-pc1-1.1.0-5.el7.noarch.rpm',
      }
    }
  }
}
