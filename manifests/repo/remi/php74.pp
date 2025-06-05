#
# = Class: yum::repo::remi::php74
#
# This module manages Remi php74 repo files for $lsbdistrelease
#
class yum::repo::remi::php74(
  $priority  = '91',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {

  case $facts['os']['release']['full'] {
    default : {}
    /^7.*/: {
      require yum::repo::remi
      file { '/etc/yum.repos.d/remi-php74.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/remi-php74.erb"),
      }
    }
    /^8.*/: {
      require yum::repo::remi
      require yum::repo::remi::modular
      file { '/etc/dnf/modules.d/php.module':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template('yum/generic/php.module.erb'),
      }
    }
  }

}
