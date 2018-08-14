# AWS CLI Docker Based on Alpine Linux

### Usage
```
sudo docker run -it -v /path/to/.aws:/root/.aws dwdraju/aws-cli-docker aws s3api list-buckets --query "Buckets[].Name"
```
