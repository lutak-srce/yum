#
# = Class: yum::repo::pgdg
#
# This module manages PostgreSQL repo files for $lsbdistrelease
# for versions > 9.3, while 9.3 and lower are managed by 'pgdg9[123]'
#
class yum::repo::pgdg {

  require yum::repo::base

  # install package depending on major version
  $pgdg_subdir = "EL-${facts['os']['release']['major']}-${facts['os']['architecture']}"

  package { 'pgdg-redhat-repo' :
    provider => 'rpm',
    source   => "https://download.postgresql.org/pub/repos/yum/reporpms/${pgdg_subdir}/pgdg-redhat-repo-latest.noarch.rpm",
  }

  file { '/etc/yum.repos.d/pgdg-redhat-all.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/pgdg-redhat-all.erb"),
    require => Package['pgdg-redhat-repo'],
  }

}
