# Class: yum::repo::chromium
#
# This module manages chromium repo files for $operatingsystemrelease
#
class yum::repo::chromium (
  $stage     = 'yumsetup',
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/chromium-el6.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/chromium-el6.erb"),
  }

}
