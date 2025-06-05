#
# = Class: yum::repo::remi::php80
#
# This module manages Remi php80 repo files for $lsbdistrelease
#
class yum::repo::remi::php80(
  $priority       = '91',
  $exclude        = [],
  $include        = [],
  $debuginfo      = false,
  $test           = false,
  $test_debuginfo = false,
) {

  case $facts['os']['release']['full'] {
    default : {}
    /^7.*/: {
      require yum::repo::remi
      file { '/etc/yum.repos.d/remi-php80.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/remi-php80.erb"),
      }
    }
  }

}
