#
# = Class: yum::repo::srce::test
#
# This module manages Srce Test repo files for $operatingsystemrelease
#
class yum::repo::srce::test (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
){

  require yum::repo::srce

  case $::operatingsystem {
    default : {}
    'CentOS' : {
      file { '/etc/yum.repos.d/srce-test.repo' :
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template('yum/CentOS/srce-test.erb'),
      }
    }
  }
}
