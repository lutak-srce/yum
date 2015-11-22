#
# = Class: yum::repo::asterisk
#
# This module manages Asterisk repo files for $operatingsystemrelease
#
# == Parameters
#
# [*stage*]
#   Type: string, default: 'yumsetup'
#   Defines run stage for this module. To avoid linking other resources to Asterisk,
#   we run it in stage yumsetup by default (before main).
#
# [*priority*]
#   Type: integer, default: 5
#   Use priority 5 to be in front of EPEL.
#
# [*exclude*]
#   Type: array, default: []
#   Which packages not to pull from this repo.
#
# [*repotype*]
#   Type: string, default: 'asterisk'
#   Asterisk offers free (asterisk) and commercial (digium) repos. By default use free.
#
# [*version*]
#   Type: string, default: '11'
#   Which version of repo to use
#
#   Possible variations of repotype & version are:
#
#    | repotype   | version       |
#    ==============================
#    | asterisk   |               |
#    | asterisk   | 1.8           |
#    | asterisk   | 1.8-certified |
#    | asterisk   | 11            |
#    | asterisk   | 12            |
#    | digium     |               |
#    | digium     | 11            |
#    | digium     | 12            |
#    | digium     | 1.8           |
#    | digium     | 1.8-certified |
#
class yum::repo::asterisk (
  $stage     = 'yumsetup',
  $priority  = '5',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $repotype = 'asterisk',
  $version  = '11',
) {
  require ::yum::repo::base

  if ( $version == '' ) {
    $repoversion = $repotype
  } else {
    $repoversion = "${repotype}-${version}"
  }


  file { "/etc/yum.repos.d/${::operatingsystem}-${repoversion}.repo" :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/asterisk/${repoversion}.erb"),
    require => Package['asterisknow-version'],
  }

  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'asterisknow-version' :
        ensure   => '3.0.1-2_centos6',
        provider => 'rpm',
        source   => 'http://packages.asterisk.org/centos/6/current/i386/RPMS/asterisknow-version-3.0.1-2_centos6.noarch.rpm',
      }
    }
  }
}
