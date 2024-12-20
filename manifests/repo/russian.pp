# Class: yum::repo::russian
#
# This module manages russian repo files for $operatingsystemrelease
#
class yum::repo::russian (
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){
  require yum::repo::base

  file { '/etc/yum.repos.d/russianfedora-free.repo' :
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/russianfedora-free.erb"),
    require => Package['russianfedora-free-release'],
  }

  case $facts['os']['release']['full'] {
    default: {}
    /^6.*/: {
      package { 'russianfedora-free-release' :
        ensure   => '6-3.R',
        provider => 'rpm',
        source   => 'http://mirror.yandex.ru/fedora/russianfedora/russianfedora/free/el/releases/6/Everything/x86_64/os/russianfedora-free-release-6-3.R.noarch.rpm',
      }
    }
  }
}
