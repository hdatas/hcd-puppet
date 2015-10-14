# Class: ssh
#
# This module manages ssh
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class ssh {
	file {"/tmp/ssh.txt":
		content => "This ssh module",
	}
	package { 'openssh-server':
		ensure => latest,
	}
}
