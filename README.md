vagrant-elk-elb
===============

A vagrant ELK setup for AWS ELB log ingestion from an S3 bucket.

This uses a CentOS box to install elasticsearch, logstash and kibana.

Logstash is configured to extract fields from the ELB log entries.

You have to configure the S3 credentials in modules/logstash-config/files/logstash.conf

In Elasticsearch the kopf and head plugin are installed

See:
http://localhost:9200/_plugin/head/
http://localhost:9200/_plugin/kopf/

And in Kibana there are some example dashboards for looking at the ELB logs.
http://localhost:8080/kibana/#/dashboard/file/elb.json
