#
# = Class: yum::repo::google::cloudsdk
#
# This module manages Google Cloud SDK repo files for $lsbdistrelease
#
class yum::repo::google::cloudsdk (
  $priority  = 1,
  $exclude   = [],
  $include   = [],
  $debuginfo = false,
) {

  require ::yum::repo::base

  exec { 'rpm_keyimport_google_cloudsdk_yumkey':
    command => '/bin/rpm --import https://packages.cloud.google.com/yum/doc/yum-key.gpg',
    unless  => '/bin/rpm -qa | /bin/grep -q gpg-pubkey-dc6315a3-6091b7b3',
  }

  exec { 'rpm_keyimport_google_cloudsdk_rpmkey':
    command => '/bin/rpm --import https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg',
    unless  => '/bin/rpm -qa | /bin/grep -q gpg-pubkey-3e1ba8d5-558ab6a8',
  }

  file { '/etc/yum.repos.d/google-cloudsdk.repo':
    ensure  => file,
    mode    => '0644',
    owner   => root,
    group   => root,
    content => template('yum/google/cloudsdk.erb'),
    require => [
      Exec['rpm_keyimport_google_cloudsdk_yumkey'],
      Exec['rpm_keyimport_google_cloudsdk_rpmkey'],
    ],
  }

}
