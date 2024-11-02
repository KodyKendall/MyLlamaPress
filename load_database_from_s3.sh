#!/bin/bash

# set -e
# Default values
DEFAULT_USER="kodyk"
DEFAULT_PSW="Biosphere" ##WARNING: Do not share.
DEFAULT_DATABASE="llama_press_development"

# Use provided arguments or default values
USER=${1:-$DEFAULT_USER}
PSW=${2:-$DEFAULT_PSW}
DATABASE=${3:-$DEFAULT_DATABASE}

echo "Select a BUCKET_NAME:"
echo "1) llamapress-ai-backups"
echo "2) fieldrocket-llamapress-ai-backups"
echo "Enter the number corresponding to the desired BUCKET_NAME:"
read BUCKET_SELECTION

# example s3 bucket route (this is how hatchbox does backups for rails apps): field-rocket-prod-backups/db_6fee0aa11d14/DATE/2024.02.07.01.40.36/db_6fee0aa11d14.tar.gz

case $BUCKET_SELECTION in
  1)
    BUCKET_NAME="llamapress-ai-backups"
    DIR="db_058e864d8c5f"
    ;;    
  2)
    BUCKET_NAME="fieldrocket-llamapress-ai-backups"
    DIR="db_84a2f6818240"
    ;;
  *)
    echo "Invalid selection"
    exit 1
    ;;
esac

BUCKET_OBJECTS=$(aws s3api list-objects --bucket $BUCKET_NAME --query "reverse(sort_by(Contents, &LastModified))" --output json)

echo "Select an output from the S3 folder:"
echo "$BUCKET_OBJECTS" | jq '.[].Key' | nl
echo "Enter the number corresponding to the desired output:"
read SELECTION

#Constructing the S3 Path to the backup file.
S3_FOLDER_PATH_TO_BACKUP=$(echo "$BUCKET_OBJECTS" | jq -r ".[$SELECTION-1].Key")
S3_BACKUP_FILE_PATH=$BUCKET_NAME/$S3_FOLDER_PATH_TO_BACKUP

aws s3 cp s3://$S3_BACKUP_FILE_PATH .


TAR=$DIR.tar
echo "We're restoring from a NEW hatchbox server! TAR=$TAR"
gzip -d $DIR.tar.gz

sudo tar -xvf $TAR 

# sudo pg_ctl stop -D /usr/local/var/postgresql@13 # make sure we're using psql 15 or 16 for this -- not 13. 
bundle exec rails db:purge DISABLE_DATABASE_ENVIRONMENT_CHECK=1

PSQLFILE=$DIR.sql

echo "psql file: $PSQLFILE"

echo "restoring database now!"

# Define PostgreSQL 16 paths -- this works for Kody's machine & psql version - might need to be modified for you. 
PG16_PATH="/usr/local/opt/postgresql@16/bin"

echo "restoring database now! If it asked for password at this step, use the psql password found in hatchbox."
${PG16_PATH}/pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $USER -d $DATABASE $PSQLFILE

echo "Done restoring, now cleaning up extra files."

sudo rm $PSQLFILE
sudo rm $TAR