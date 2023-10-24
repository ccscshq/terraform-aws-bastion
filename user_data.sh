#!/bin/bash

cd /tmp
sudo yum update -y

# aarch64 / arm64 -> arm64. others -> amd64
arch=$(arch | grep -q ar && echo "arm64" || echo "amd64")
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_${arch}/amazon-ssm-agent.rpm
