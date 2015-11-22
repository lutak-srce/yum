#
# = Class: yum::repo::cuda
#
# This class manages CUDA repo files for $lsbdistrelease
#
class yum::repo::cuda (
  $stage     = 'yumsetup',
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {
  file { '/etc/yum.repos.d/cuda.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/cuda.erb"),
    require => Package['cuda-repo-rhel6'],
  }

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      package { 'cuda-repo-rhel6':
        ensure   => present,
        provider => 'rpm',
        source   => 'http://developer.download.nvidia.com/compute/cuda/repos/rhel6/x86_64/cuda-repo-rhel6-5.5-0.x86_64.rpm',
      }
    }
  }
}
