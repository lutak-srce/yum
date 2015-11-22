# Class: yum::repo::elrepo::testing
#
# This module manages ElRrepo Extras repo files for $operatingsystemrelease
#

# CentOS
class yum::repo::elrepo::testing (
  $stage     = 'yumsetup',
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::elrepo

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/elrepo-testing.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/elrepo-testing.erb"),
      }
    }
  }
}
