# Class: yum::conf
#
# This module manages yum packages
#
class yum::conf (
  $stage         = 'yumconf',
  $yum_proxy     = 'UNDEF',
  $http_proxy    = 'UNDEF',
  $http_port     = '80',
  $purge_repos_d = true,
  $distroverpkg  = 'centos-release',
) {
  case $::operatingsystemrelease {
    default: {}
    /^5.*/: {
      file { '/etc/yum.conf' :
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('yum/el5.yum.conf.erb'),
      }
    }
    /^6.*/: {
      file { '/etc/yum.conf' :
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('yum/el6.yum.conf.erb'),
      }
    }
    /^7.*/: {
      file { '/etc/yum.conf' :
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => '0644',
        content => template('yum/el7.yum.conf.erb'),
      }
    }
  }

  if ( $http_proxy != 'UNDEF' ) {
    file { '/etc/rpm/macros.proxy' :
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('yum/macros.proxy.erb'),
    }
  }

  # base package
  package {'yum': ensure => present }

  # directory for repositories
  file { '/etc/yum.repos.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    recurse => true,
    purge   => $purge_repos_d,
    force   => true,
    require => Package['yum'],
  }
}
