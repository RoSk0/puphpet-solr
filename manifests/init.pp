# == Class: solr
#
# Full description of class solr here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'solr':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class solr ($version = '4.10.2') {

# Setting JRE package name.
#  Which is correct $operatingsystem or $::operatingsystem?
  case $operatingsystem {
    centos, redhat: { $jre = 'java-1.8.0-openjdk' }
    debian, ubuntu: { $jre = 'default-jre' }

    default: { fail("Supports only CentOS/RHEL and Ubuntu/Debian. You have used: ${operatingsystem}.") }
  }

  package {'jre':
    name   => $jre,
    ensure => installed,
  }

}
