class logstash-config {
	file{ "/etc/logstash/conf.d/logstash.conf":
		source => "puppet:///modules/logstash-config/logstash.conf",
		require=> Package["logstash"],
		notify => Service["logstash"]
	}
}