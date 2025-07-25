#
# = Class: yum::repo::remi::php81
#
# This module manages Remi php81 repo files for $lsbdistrelease
#
class yum::repo::remi::php81(
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
      file { '/etc/yum.repos.d/remi-php81.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/remi-php81.erb"),
      }
    }
  }

}
