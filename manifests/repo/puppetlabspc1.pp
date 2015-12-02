<<<<<<< HEAD
#
# = Class: yum::repo::puppetlabls
=======
# Class: yum::repo::puppetlabls
>>>>>>> 98813fe... add puppetlabs-pc1 repo
#
# This module manages PuppetLabs repo files for $lsbdistrelease
#
class yum::repo::puppetlabspc1 (
<<<<<<< HEAD
=======
  $stage     = 'yumsetup',
>>>>>>> 98813fe... add puppetlabs-pc1 repo
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source    = false,
  $devel     = false,
) {
  require yum::repo::base

<<<<<<< HEAD
  file { '/etc/yum.repos.d/puppetlabs-pc1.repo' :
=======
  file { '/etc/yum.repos.d/puppetlabis-pc1.repo' :
>>>>>>> 98813fe... add puppetlabs-pc1 repo
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
<<<<<<< HEAD
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/puppetlabs-pc1.erb"),
=======
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/puppetlabspc1.erb"),
>>>>>>> 98813fe... add puppetlabs-pc1 repo
    require => Package['puppetlabs-release-pc1'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      package { 'puppetlabs-release-pc1' :
<<<<<<< HEAD
=======
        ensure   => '1.0.0-1',
>>>>>>> 98813fe... add puppetlabs-pc1 repo
        provider => 'rpm',
        source   => 'https://yum.puppetlabs.com/puppetlabs-release-pc1-el-5.noarch.rpm',
      }
    }
    /^6.*/: {
      package { 'puppetlabs-release-pc1' :
<<<<<<< HEAD
=======
        ensure   => '1.0.0-1',
>>>>>>> 98813fe... add puppetlabs-pc1 repo
        provider => 'rpm',
        source   => 'https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'puppetlabs-release-pc1' :
<<<<<<< HEAD
=======
        ensure   => '1.0.0-1',
>>>>>>> 98813fe... add puppetlabs-pc1 repo
        provider => 'rpm',
        source   => 'https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm',
      }
    }
  }
}
