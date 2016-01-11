# == Class: ui
#
# Full description of class ui here.
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
#  class { 'ui':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#

class honeycomb-ui::gitclone ($repo, $username="ceph") {
	
	$grip = $username

	group { $username:
        	ensure  => present,
		gid     => 1000,
	}

	user { "$username":
        	ensure  => present,
        	gid     => $grip,
		require => Group[$grip],
		uid     => 1000,
		home    => "/home/${username}",
		shell   => "/bin/bash",
		managehome  => true,
    	}

	file { "/opt/honeycomb-ui" :
		ensure  => directory,
		group   => $grip,
		owner   => $username,
		mode    => 0755,
	}

	file { "/home/${username}":
		ensure  => directory,
		group   => $grip,
		owner   => ceph,
		mode    => 0700,
	}

	package { "git":
        	ensure => installed,
	}

	vcsrepo { "/opt/honeycomb-ui":
		ensure   => latest,
#		owner    => $owner,
#		group    => $owner,
		provider => git,
# git clone ssh://git@github.com/hdatas/honeycomb-ui /tmp/honeycomb-ui (debug on command line)
		require  => [ Package["git"] ],
#		require  => File['/home/ceph/.ssh/id_rsa'],
#		source   => "https://github.com/hdatas/honeycomb-ui",
		source	=> 'ssh://git@github.com/hdatas/honeycomb-ui',
		revision => 'master',
    }
		
}

class honeycomb-ui {
	class { honeycomb-ui::gitclone: repo => 'honeycomb-ui'}

}
