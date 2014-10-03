class kibana-config {
	file { "/opt/kibana/kibana-3.1.1/app/dashboards/elb.json":
		source => "puppet:///modules/kibana-config/elb.json",
		require => Exec["unpack-kibana"]
	}
}