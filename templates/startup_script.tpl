 #! /bin/bash

   sudo amazon-linux-extras install -y nginx1
   sudo service nginx start
   aw s3 cp s3://${s3_bucket_name}/website/index.html /home/ec2-user/share/nginx/index.html
   aws s3 cp s3://${s3_bucket_name}/website/globo_logo_vert.png