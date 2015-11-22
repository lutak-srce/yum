# Class: yum
#
# This module manages yum packages
#
class yum {
  # declare running stages
  stage {'yumsetup': before => Stage['main'] }
  stage {'yumconf':  before => Stage['yumsetup'] }

  # brings yum, yum.conf and yum.repos.d
  include ::yum::conf

}
