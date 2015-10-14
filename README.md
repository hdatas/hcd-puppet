#hcd-puppet

git clone https://github.com/hdatas/hcd-puppet

mv hcd-puppet modules

To incorporate honeycomb module
===============================
Edit /etc/puppet/manifests/site.pp
	import 'honeycomb.pp'

Touch /etc/puppet/manifests/honeycomb.pp

Define action in honeycomb.pp to include hcd-puppet module

Example of honeycomb.pp
=======================
node default {
}

node 'ceph01' {
	include honeycomb
}

node 'ceph02' {
	include honeycomb
}




