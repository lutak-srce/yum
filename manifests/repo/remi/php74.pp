#
# = Class: yum::repo::remi::php74
#
# This module manages Remi php74 repo files for $lsbdistrelease
#
class yum::repo::remi::php74(
) {

  require yum::repo::remi
  require yum::repo::remi::modular

  case $::operatingsystemrelease {
    default: {
      fail("The ${name} module is not supported on ${operatingsystem} ${operatingsystemrelease}.")
    }
    /^8.*/: {
      package { 'php:remi-7.4':
        enable_only => true,
        provider    => 'dnfmodule',
      }
    }
  }

}
