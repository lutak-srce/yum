#
# = Class: yum::repo::google::kubernetes
#
# This module manages Google kubernetes repo files for $lsbdistrelease
#
class yum::repo::google::kubernetes (
  $baseurl   = undef,
  $version   = '1.25',
  $priority  = 1,
  $exclude   = [ 'kubelet', 'kubeadm', 'kubectl', 'cri-tools', 'kubernetes-cni' ],
  $include   = [],
){
  require ::yum::repo::base

  file { '/etc/yum.repos.d/kubernetes.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/google/kubernetes.erb'),
  }

}
