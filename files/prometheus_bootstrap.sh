#!/bin/bash

set -e

cat >/tmp/puppet.pp << "EOF"
class { '::prometheus::node_exporter':
  collectors => ['systemd','filefd','diskstats','filesystem','loadavg','meminfo','netdev','stat','time']
}

class { '::prometheus':
  global_config  => { 'scrape_interval'=> '5s', 'evaluation_interval'=> '15s', 'external_labels'=> { 'monitor'=>'primary'}},
  scrape_configs => [ { 'job_name'=> 'prometheus', 'scrape_interval'=> '1s', 'scrape_timeout'=> '1s', 'target_groups'=> [ { 'targets'=> [ 'localhost:9090' ], 'labels'=> { 'alias'=> 'Prometheus'} } ] }, { 'job_name'=> 'host', 'ec2_sd_configs'=> { 'region'=> 'us-east=1', 'port'=> 9100 } } ]
}
EOF

echo "Running Puppet..."
sudo /opt/puppetlabs/bin/puppet apply /tmp/puppet.pp
