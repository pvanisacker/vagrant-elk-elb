class logstash-install {
  yumrepo { "logstash-1.4":
    baseurl => "http://packages.elasticsearch.org/logstash/1.4/centos",
    descr => "logstash-1.4",
    enabled => 1,
    gpgcheck => 1,
    gpgkey => "http://packages.elasticsearch.org/GPG-KEY-elasticsearch",
  }

  class { "logstash":
    require => Yumrepo["logstash-1.4"]
  }
}