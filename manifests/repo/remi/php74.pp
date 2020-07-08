#
# = Class: yum::repo::remi::php74
#
# This module manages Remi php74 repo files for $lsbdistrelease
#
class yum::repo::remi::php74(
) {
  require yum::repo::remi
  require yum::repo::remi::modular

  file { '/etc/dnf/modules.d/php.module':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/generic/php.module.erb"),
  }
}
