class kibana-install {
	$packages=["curl","tar","httpd"]
	package { $packages:
		ensure => installed
	}
	file { "/opt/kibana":
		ensure => "directory"
	}
	exec { "download-kibana":
		command => "/usr/bin/curl https://download.elasticsearch.org/kibana/kibana/kibana-3.1.1.tar.gz -o /tmp/kibana-3.1.1.tar.gz",
		require => Package["curl"]
	}
	exec { "unpack-kibana":
		command => "/bin/tar -xzf /tmp/kibana-3.1.1.tar.gz -C /opt/kibana",
		require => [Exec["download-kibana"],File["/opt/kibana"]]
	}
	file { "/etc/httpd/conf.d/kibana.conf":
		source => "puppet:///modules/kibana-install/kibana.conf",
		notify => Service["httpd"]
	}
	service { "httpd":
		enable => "true",
		ensure => "running"
	}
}