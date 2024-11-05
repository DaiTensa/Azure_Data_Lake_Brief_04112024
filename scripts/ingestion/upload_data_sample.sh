#!/bin/bash

set -o allexport
. .env
set +o allexport


# Test Copy file to Blob Container
# azcopy copy "https://$STORAGE_ACCOUNT_NAME.blob.core.windows.net/$BLOB_CONTAINER_NAME/input_data_azcopy/.keep?$SAS"
# azcopy copy '/home/dai/Documents/Python_Projects/Azure_Data_Lake_Brief_04112024/scripts/ingestion/test.txt' "https://$STORAGE_ACCOUNT_NAME.blob.core.windows.net/$BLOB_CONTAINER_NAME/input_data_azcopy/test.txt?$SAS"

# Copy files 
azcopy copy '/home/dai/Documents/Python_Projects/Azure_Data_Lake_Brief_04112024/data/samples-20241104T134348Z-001/samples/*' \
        "https://$STORAGE_ACCOUNT_NAME.dfs.core.windows.net/$BLOB_CONTAINER_NAME/input_data_azcopy?$SAS" --recursive 