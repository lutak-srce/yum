#
# = Class: yum
#
# This module manages yum packages
#
class yum (
  $yum_proxy         = 'UNDEF',
  $http_proxy        = 'UNDEF',
  $http_port         = '80',
  $purge_repos_d     = true,
  $distroverpkg      = 'centos-release',
  $installonly_limit,
) {

  File {
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package['yum'],
  }

  # base package
  package {'yum': ensure => present }

  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      file { '/etc/yum.conf' :
        content => template('yum/el5.yum.conf.erb'),
      }
    }
    /^6.*/: {
      file { '/etc/yum.conf' :
        content => template('yum/el6.yum.conf.erb'),
      }
    }
    /^7.*/: {
      file { '/etc/yum.conf' :
        content => template('yum/el7.yum.conf.erb'),
      }
    }
    /^8.*/: {
      file { '/etc/dnf/dnf.conf' :
        content => template('yum/el8.dnf.conf.erb'),
      }
    }
  }

  if ( $http_proxy != 'UNDEF' ) {
    file { '/etc/rpm/macros.proxy' :
      content => template('yum/macros.proxy.erb'),
    }
  }


  # directory for repositories
  file { '/etc/yum.repos.d':
    ensure  => directory,
    recurse => true,
    purge   => $purge_repos_d,
    force   => true,
  }

}
