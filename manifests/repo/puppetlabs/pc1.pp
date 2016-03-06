#
# = Class: yum::repo::puppetlabls::pc1
#
# This module manages PuppetLabs repo files for $lsbdistrelease PC1
#
class yum::repo::puppetlabs::pc1 (
  $stage     = 'yumsetup',
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
        ensure   => '1.0.0-1.el5',
        provider => 'rpm',
        source   => 'http://yum.puppetlabs.com/el/5/PC1/x86_64/puppetlabs-release-pc1-1.0.0-1.el5.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'puppetlabs-release-pc1' :
        ensure   => '1.0.0-1.el6',
        provider => 'rpm',
        source   => 'http://yum.puppetlabs.com/el/6/PC1/x86_64/puppetlabs-release-pc1-1.0.0-1.el6.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'puppetlabs-release-pc1' :
        ensure   => '1.0.0-1.el7',
        provider => 'rpm',
        source   => 'http://yum.puppetlabs.com/el/7/PC1/x86_64/puppetlabs-release-pc1-1.0.0-1.el7.noarch.rpm',
      }
    }
  }
}
