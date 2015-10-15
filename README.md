#hcd-puppet

To install module from tarball

Download ceph-honeycomb-0.0.1.tar.gz 
$ puppet module install ceph-honeycomb-0.0.1.tar.gz


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


@master node

$ cd /etc/puppet

$ puppet apply manifests/site.pp

For testing on ceph01
@ceph01 node

$ puppet agent --test
