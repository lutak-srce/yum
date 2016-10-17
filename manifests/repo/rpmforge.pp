# Class: yum::repo::rpmforge
#
# This module manages Base repo files for $operatingsystemrelease
#
class yum::repo::rpmforge (
  $priority  = '51',
  $exclude   = [ 'fortune*', 'atftp-server' ],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/rpmforge.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/rpmforge.erb"),
    require => Package['rpmforge-release'],
  }

  case $::operatingsystemrelease {
    default : {}
    /^5.*/: {
      package {'rpmforge-release':
        ensure   => '0.5.3-1.el5.rf',
        provider => 'rpm',
        source   => 'http://apt.sw.be/redhat/el5/en/i386/rpmforge/RPMS/rpmforge-release-0.5.3-1.el5.rf.i386.rpm',
      }
    }
    /^6.*/: {
      package {'rpmforge-release':
        ensure   => '0.5.3-1.el6.rf',
        provider => 'rpm',
        source   => 'http://merlin.fit.vutbr.cz/mirrors/repoforge/redhat/el6/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm',
      }
    }
    /^7.*/: {
      package {'rpmforge-release':
        ensure   => '0.5.3-1.el7.rf',
        provider => 'rpm',
        source   => 'http://mirrors.neterra.net/repoforge/redhat/el7/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm',
      }
    }
  }
}
