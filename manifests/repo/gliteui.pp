# Class: yum::repo::gliteui
#
# This module manages gLite UI repo
#
class yum::repo::gliteui (
  $stage   = 'yumsetup',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  require yum::repo::base

  file { '/etc/yum.repos.d/glite-UI.repo' :
    ensure => file,
    mode   => '0644',
    owner  => root,
    group  => root,
    source => "puppet:///modules/yum/${::operatingsystem}/${::operatingsystemrelease}/glite-UI.repo",
  }
}
