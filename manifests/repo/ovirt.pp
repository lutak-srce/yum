#
# = Class: yum::repo::ovirt
#
# This class manages ovirt repo files for $lsbdistrelease
#
class yum::repo::ovirt (
  $stage     = 'yumsetup',
  $priority  = '2',
  $version   = '4.2',
  $exclude   = [],
  $include   = [],
) {

  $version_nodot = regsubst($version, '\.', '')

  include ::yum::repo::epel
  include ::yum::repo::base::extras
  include ::yum::repo::base::ovirt
  include ::yum::repo::base::gluster
  include ::yum::repo::base::sclorh
  include ::yum::repo::base::opstools

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {
      package { "ovirt-release${version_nodot}":
        ensure   => present,
        provider => 'rpm',
        source   => "http://resources.ovirt.org/pub/yum-repo/ovirt-release${version_nodot}.rpm",
      }
    }
  }

  file { "/etc/yum.repos.d/ovirt-${version}.repo":
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/ovirt.erb"),
    require => Package["ovirt-release${version_nodot}"],
  }

}
