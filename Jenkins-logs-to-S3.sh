#pre-requests 1. AWS CLI 2. S3 bucket 3. AWS configuration

#!/bin/bash

JENKINS_HOME="/var/lib/jenkins"  
S3_BUCKET="s3://Krishna"  
DATE=$(date +%Y-%m-%d)  

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it to proceed."
    exit 1
fi

# Iterate through all job directories
for job_dir in "$JENKINS_HOME/jobs/"*/; do
    job_name=$(basename "$job_dir")
    
    # Iterate through build directories for the job
    for build_dir in "$job_dir/builds/"*/; do
        # Get build number and log file path
        build_number=$(basename "$build_dir")
        log_file="$build_dir/log"

        
        if [ -f "$log_file" ] && [ "$(date -r "$log_file" +%Y-%m-%d)" == "$DATE" ]; then
            
            aws s3 cp "$log_file" "$S3_BUCKET/$job_name-$build_number.log" --only-show-errors
            
            if [ $? -eq 0 ]; then
                echo "Uploaded: $job_name/$build_number to $S3_BUCKET/$job_name-$build_number.log"
            else
                echo "Failed to upload: $job_name/$build_number"
            fi
        fi
    done
done