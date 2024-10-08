# Class: yum::repo::epel
#
# This module manages EPEL repo files for $lsbdistrelease
#
class yum::repo::epel (
  $priority  = '11',
  $exclude   = [],
  $include   = [],
  $baseurl   = undef,
  $debuginfo = false,
  $source    = false,
) {

  file { '/etc/yum.repos.d/epel.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/${facts['os']['release']['full']}/epel.erb"),
    require => Package['epel-release'],
  }

  $release_package = $facts['os']['release']['major'] ? {
    '6'     => 'https://archives.fedoraproject.org/pub/archive/epel/6/x86_64/Packages/e/epel-release-6-8.noarch.rpm',
    '7'     => 'https://archives.fedoraproject.org/pub/archive/epel/7/x86_64/Packages/e/epel-release-7-14.noarch.rpm',
    default => "https://dl.fedoraproject.org/pub/epel/epel-release-latest-${facts['os']['release']['major']}.noarch.rpm",
  }

  # install package depending on major version
  package { 'epel-release':
    provider => 'rpm',
    source   => $release_package,
  }

}
