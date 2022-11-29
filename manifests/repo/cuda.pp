#
# = Class: yum::repo::cuda
#
# This class manages CUDA repo files for $lsbdistrelease
#
class yum::repo::cuda (
  $priority  = '1',
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {

  # install package depending on major version
  case $::operatingsystemrelease {
    default: {}
    /^6.*/: {
      file { '/etc/yum.repos.d/cuda.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/cuda.erb"),
        require => Package['cuda-repo-rhel6'],
      }
      package { 'cuda-repo-rhel6':
        ensure   => '8.0.44-1',
        provider => 'rpm',
        source   => 'http://developer.download.nvidia.com/compute/cuda/repos/rhel6/x86_64/cuda-repo-rhel6-8.0.44-1.x86_64.rpm',
      }
    }
    /^7.*/: {
      file { '/etc/yum.repos.d/cuda.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/${::operatingsystemrelease}/cuda.erb"),
        require => Package['cuda-repo-rhel7'],
      }
      package { 'cuda-repo-rhel7':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm',
      }
    }
    /^8.*/: {
      file { '/etc/yum.repos.d/cuda.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/cuda.erb"),
        require => Package['cuda-repo-rhel8'],
      }
      package { 'cuda-repo-rhel8':
        ensure   => present,
        provider => 'rpm',
        source   => 'https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-repo-rhel8-10.2.89-1.x86_64.rpm',
      }
    }
    /^9.*/: {
      file { '/etc/yum.repos.d/cuda.repo':
        ensure  => file,
        mode    => '0644',
        owner   => root,
        group   => root,
        content => template("yum/${::operatingsystem}/cuda.erb"),
      }
    }
  }
}
