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
        /^6\.[1-6]$/: {
          package { 'centos-release': }
          # yum helpers
          package { 'yum-utils': }
          package { 'yum-plugin-changelog': }
          package { 'yum-plugin-downloadonly': }
          package { 'yum-plugin-merge-conf': }
          package { 'yum-plugin-priorities': }
          package { 'yum-plugin-protectbase': }
          package { 'yum-plugin-upgrade-helper': }
          package { 'yum-plugin-versionlock': }
        }
        /^6\.([7-9]$)|([1-6][0-9]$)/: {
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
    'Fedora': {
      file { '/etc/yum.repos.d/fedora.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/fedora.erb"),
        require => Package['fedora-release'],
      }
      file { '/etc/yum.repos.d/fedora-updates.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/fedora-updates.erb"),
        require => Package['fedora-release'],
      }
      case $::operatingsystemrelease {
        default: {
          $nameaddon = '-plugin'
        }
        /^18.*/: {
          $nameaddon = '-plugin'
          package { 'fedora-release':
            ensure   => present,
            provider => rpm,
            source   => 'http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/fedora/linux/releases/18/Fedora/x86_64/os/Packages/f/fedora-release-18-1.noarch.rpm',
          }
          package { 'fedora-release-notes':
            ensure   => present,
            provider => rpm,
            source   => 'http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/fedora/linux/releases/18/Fedora/x86_64/os/Packages/f/fedora-release-notes-18.0.0-3.fc18.noarch.rpm',
          }
        }
      }
      case $::operatingsystemrelease {
        default: {
        }
        /^18.*/: {
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
