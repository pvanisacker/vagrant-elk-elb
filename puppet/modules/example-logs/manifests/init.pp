class example-logs{
	file {"/var/log/elb.log":
		source => "puppet:///modules/example-logs/elb.log"
	}
}