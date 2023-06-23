NULL_PROVIDER, COUNT & COUNT.INDEX

This repo contains files for testing the behavior of terraform null_provider, count meta-argument and count.index as a part of configuration.

SOURCE - Terraform Registry.

DESCRIPTION

Terraform null_provider is a different kind of provider. Unlike standart providers for AWS, Azure and other vendors this one doesn't communicate with any cloud. 
The null-provider has its own resources and they can be found in terraform registry (null_resources, null_data_source). Count is a meta-argument witch is used to deploy multiple equal resources 
in a given cloud - in this case 
