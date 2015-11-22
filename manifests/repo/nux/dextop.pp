#
# = Class: yum::repo::nux::dextop
#
# This module manages Nux DeXtop files for $lsbdistrelease
#
class yum::repo::nux::dextop (
  $stage     = 'yumsetup',
  $priority  = '99',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
  $source    = false,
) {

  file { '/etc/yum.repos.d/nux-dextop.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/nux/dextop.erb"),
    require => Package['nux-dextop-release'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'nux-dextop-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://li.nux.ro/download/nux/dextop/el6/x86_64/nux-dextop-release-0-2.el6.nux.noarch.rpm',
      }
    }
    /^7.*/: {
      package { 'nux-dextop-release':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm',
      }
    }
  }
}
