class elasticsearch-install {
  yumrepo { "elasticsearch-1.3":
    baseurl => "http://packages.elasticsearch.org/elasticsearch/1.3/centos",
    descr => "elasticsearch-1.3",
    enabled => 1,
    gpgcheck => 1,
    gpgkey => "http://packages.elasticsearch.org/GPG-KEY-elasticsearch",
  }

  class { "elasticsearch":
    java_install => true,
    config => {
      "cluster" => { 
        "name" => "vagrant_elasticsearch"
      },
      "index" => {
        "number_of_replicas" => "0",
        "number_of_shards" => "1",
      },
      "network" => {
        "host" => "0.0.0.0",
      }
    },
    notify => Service["elasticsearch"],
    require => Yumrepo["elasticsearch-1.3"]
  }

  # Installing plugins, the elasticsearch::plugin stuff doesn't seem to work
  exec { "plugin-kopf-install":
    command => "/usr/share/elasticsearch/bin/plugin -i lmenezes/elasticsearch-kopf || exit 0",
    notify => Service["elasticsearch"]
  }
  exec { "plugin-head-install":
    command => "/usr/share/elasticsearch/bin/plugin -i mobz/elasticsearch-head || exit 0",
    notify => Service["elasticsearch"]
  }

  service { "elasticsearch":
    name => "elasticsearch",
    ensure => running
  }
}