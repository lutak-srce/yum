# Class: yum::repo::base
#
# This module manages Base repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::base (
  $stage     = 'yumsetup',
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){

  case $::operatingsystem {
    # Amazon AMI Linux (RedHat derivative)
    'Amazon' : {
      include ::yum::repo::base::amazon
    }
    # RedHat Enterprise Linux
    'RedHat': {
      file { '/etc/yum.repos.d/redhat.repo':
        ensure => file,
        mode   => '0644',
        owner  => root,
        group  => root,
      }
    }
    # CentOS (Community Enterprise Operating System)
    'CentOS' : {
      file { '/etc/yum.repos.d/CentOS-Base.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-Base.erb"),
        require => Package['centos-release'],
      }

      if ( $debuginfo ) {
        file { '/etc/yum.repos.d/CentOS-Debuginfo.repo':
          ensure  => file,
          mode    => '0644',
          owner   => root,
          group   => root,
          content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/CentOS-Debuginfo.erb"),
          require => Package['centos-release'],
        }
      }

      case $::operatingsystemrelease {
        default: {
        }
        /^5.*/: {
          package { 'centos-release': }
          package { 'centos-release-notes': }
          # yum helpers
          package { 'yum-utils': }
          package { 'yum-changelog': }
          package { 'yum-downloadonly': }
          package { 'yum-merge-conf': }
          package { 'yum-priorities': }
          package { 'yum-protectbase': }
          package { 'yum-upgrade-helper': }
          package { 'yum-versionlock': }
        }
        /^6.*/: {
          package { 'centos-release': }
          # yum helpers
          package { 'yum-utils': }
          package { 'yum-plugin-changelog': }
          if ( 0 + $::operatingsystemrelease < 6.7 ) { package { 'yum-plugin-downloadonly': } }
          package { 'yum-plugin-merge-conf': }
          package { 'yum-plugin-priorities': }
          package { 'yum-plugin-protectbase': }
          package { 'yum-plugin-upgrade-helper': }
          package { 'yum-plugin-versionlock': }
        }
        /^7.*/: {
          package { 'centos-release': }
          # yum helpers
          package { 'yum-utils': }
          package { 'yum-plugin-changelog': }
          package { 'yum-plugin-merge-conf': }
          package { 'yum-plugin-priorities': }
          package { 'yum-plugin-protectbase': }
          package { 'yum-plugin-upgrade-helper': }
          package { 'yum-plugin-versionlock': }
        }
      }
    }
  }
}
