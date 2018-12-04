#!/bin/bash

SCRIPT_DIR=`echo $(cd $(dirname $0);pwd)`
LOG_DIR="${SCRIPT_DIR}/logs"
LOG_BLOBS="${SCRIPT_DIR}/logs/blobs.txt"
LOG_YAML="${SCRIPT_DIR}/logs/object_size.yml"

cd $SCRIPT_DIR
mkdir -p "${LOG_DIR}"

sudo -u git find /data/user/storage/ -type f -exec du --time -h {} + | sort -hr | head -1000| awk -F / '{print $NF}' > "${LOG_BLOBS}"
github-env "export LOG_BLOBS=${LOG_BLOBS}; bin/runner ${SCRIPT_DIR}/blobs.rb" > "${LOG_YAML}"
ruby yaml_to_tsv.rb

