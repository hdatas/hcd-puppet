# Class: honeycomb
#
# This module manages honeycomb
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
import "../ssh/manifests/init.pp"
class honeycomb {
	file {"/tmp/honeycomb":
		content => "Honeycomb module loaded",
	}
	include ssh
}
