#!/bin/bash

set -o allexport
. .env
set +o allexport


# Generate SAS Token for my Container
SAS=$(az storage container generate-sas --account-name $STORAGE_ACCOUNT_NAME \
    --name $BLOB_CONTAINER_NAME \
    --permissions acdlrw \
    --expiry $EXPIRE \
    --auth-mode login --as-user \
    --output tsv)

#create a factory
if [ -z "$SAS" ]; then
    
    echo "ERROR"
    
else 
    echo "Generating SAS container Token  . OK!"
    sed -i "/^SAS=/d" .env
    echo "SAS='$SAS'" >> .env
fi
