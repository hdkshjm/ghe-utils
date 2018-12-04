#!/bin/bash

show_repository_uri(){
local arg_repository_path=$1

local repository_id=`echo $arg_repository_path |awk -F / '{print $NF}'|awk -F . '{print $1}'`
local repository_uri=`ghe-nwo ${repository_id}`

if echo "${repository_uri}"|grep "error: could not find repository with ID" > /dev/null 2>&1; then
   repository_uri=`sudo -u git cat "${arg_repository_path}/info/nwo"`
   echo "${arg_repository_path} ${repository_uri} deleted"
else
   echo "${arg_repository_path} ${repository_uri}"
fi

}

sudo -u git find /data/user/repositories/ -type d -name "*.git" -exec du --time -sh {} + | sort -hr | head -1000 | while read line
do
  repository_dirname=`echo ${line}|awk -F / '{print $NF}'|awk -F . '{print $1}'`
  repository_path=`echo ${line}|awk '{print $4}'`
  if [ "${repository_dirname}" != "network" ]; then
     echo "${line} `show_repository_uri ${repository_path}`"
  else
    original_repository_dirname=`sudo -u git ls -1v "${repository_path}/../" |grep "^[0-9]"|awk -F . '{print $1}'|sort -n |head -n 1`
    original_repository_path=`sudo -u git readlink -f "${repository_path}/../${original_repository_dirname}.git"`
    echo "${line} `show_repository_uri ${original_repository_path}`"
  fi
done

