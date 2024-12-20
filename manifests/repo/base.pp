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

  case $facts['os']['name'] {
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
      case $facts['os']['release']['full'] {
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
            content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/rocky.erb"),
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
            content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/Rocky-Base.erb"),
            require => Package['rocky-release'],
          }

          if ( $debuginfo ) {
            file { '/etc/yum.repos.d/Rocky-Debuginfo.repo':
              ensure  => file,
              mode    => '0644',
              owner   => root,
              group   => root,
              content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/Rocky-Debuginfo.erb"),
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
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/oracle-linux.erb"),
        require => Package['oraclelinux-release'],
      }
      case $facts['os']['release']['full'] {
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
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/CentOS-Base.erb"),
        require => Package['centos-release'],
      }

      if ( $debuginfo ) {
        file { '/etc/yum.repos.d/CentOS-Debuginfo.repo':
          ensure  => file,
          mode    => '0644',
          owner   => root,
          group   => root,
          content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/CentOS-Debuginfo.erb"),
          require => Package['centos-release'],
        }
      }

      case $facts['os']['release']['full'] {
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
          if Float($facts['os']['release']['full']) < 6.7  { package { 'yum-plugin-downloadonly': } }
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
