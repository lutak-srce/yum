# Class: yum::repo::base
#
# This module manages Base repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::base (
  $priority        = '1',
  $exclude         = [],
  $include         = [],
  $baseurl         = undef,
  $baseurl_updates = undef,
  $baseurl_debug   = undef,
  $baseurl_source  = undef,
  $debuginfo       = false,
  $source          = false,
){

  case $::operatingsystem {
    default: {
    }
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

      case $facts['os']['release']['major'] {
        default: { }
        '8': { package { 'yum-utils': } }
      }
    }

    'Rocky' : {
      case $::operatingsystemrelease {
        default: {
        }
        /^9.*/: {
          package { 'rocky-release': }
          package { 'yum-utils': }
          file { '/etc/yum.repos.d/rocky.repo':
            ensure  => file,
            mode    => '0644',
            owner   => root,
            group   => root,
            content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/rocky.erb"),
            require => Package['rocky-release'],
          }
        }
        /^8.*/: {
          package { 'rocky-release': }
          package { 'yum-utils': }
          file { '/etc/yum.repos.d/Rocky-Base.repo':
            ensure  => file,
            mode    => '0644',
            owner   => root,
            group   => root,
            content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/Rocky-Base.erb"),
            require => Package['rocky-release'],
          }

          if ( $debuginfo ) {
            file { '/etc/yum.repos.d/Rocky-Debuginfo.repo':
              ensure  => file,
              mode    => '0644',
              owner   => root,
              group   => root,
              content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/Rocky-Debuginfo.erb"),
              require => Package['rocky-release'],
            }
          }
        }
      }
    }

    'OracleLinux' : {
      file { '/etc/yum.repos.d/oracle-linux.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/oracle-linux.erb"),
        require => Package['oraclelinux-release'],
      }
      case $::operatingsystemrelease {
        default: {
          package { 'oraclelinux-release': }
        }
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
          if Float($::operatingsystemrelease) < 6.7  { package { 'yum-plugin-downloadonly': } }
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
          package { 'yum-plugin-copr': }
          package { 'yum-plugin-merge-conf': }
          package { 'yum-plugin-priorities': }
          package { 'yum-plugin-protectbase': }
          package { 'yum-plugin-upgrade-helper': }
          package { 'yum-plugin-versionlock': }
        }
        /^8.*/: {
          package { 'yum-utils': }
          package { 'centos-release': }
        }
      }
    }
  }
}
