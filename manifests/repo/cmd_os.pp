#
# = Class: yum::repo::cmd_os
#
# This module manages CMD-OS repo files
#
class yum::repo::cmd_os (
  $priority  = 1,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
){

  require yum::repo::base

  file { '/etc/yum.repos.d/CMD-OS-1.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template("yum/${facts['os']['name']}/CMD-OS-1.erb"),
    require => Package['cmd-os-release'],
  }

  file { '/etc/yum.repos.d/EGI-trustanchors.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/yum/${facts['os']['name']}/EGI-trustanchors.repo",
    require => Package['cmd-os-release'],
  }

  package { 'cmd-os-release':
    provider => 'rpm',
    source   => "http://repository.egi.eu/sw/production/cmd-os/1/centos${::facts['os']['release']['major']}/x86_64/base/cmd-os-release-1.0.1-1.el${::facts['os']['release']['major']}.centos.noarch.rpm",
  }

}
