#hcd-puppet
'''
On Master

sudo puppet module install puppetlabs/vcsrepo
or
puppet module install puppetlabs-vcsrepo

git clone https://github.com/hdatas/hcd-puppet

mv hcd-puppet modules

/etc/puppet/manifests/site.pp
#####
import "honeycombui"

node ceph1 {
        class { "honeycomb-ui":
        }
}
#####

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

'''
