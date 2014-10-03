vagrant-elk-elb
===============

A vagrant ELK setup for AWS ELB log ingestion from an S3 bucket.

This uses a CentOS box to install elasticsearch, logstash and kibana.

Logstash is configured to extract fields from the ELB log entries.

You have to configure the S3 credentials in modules/logstash-config/files/logstash.conf

In Elasticsearch the kopf and head plugin are installed

And in Kibana there are some example dashboards for looking at the ELB logs.
