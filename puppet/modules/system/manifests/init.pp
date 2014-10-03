class system {
	service { "iptables":
		ensure => "stopped";
	}
	service { "ip6tables":
		ensure => "stopped";
	}
}