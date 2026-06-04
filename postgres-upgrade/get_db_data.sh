#!/usr/bin/env bash

while IFS= read -r line; do
  REPO_NAME=$line
  if [ -z $line ]; then
    continue;
  fi
  if [ $REPO_NAME == "mosip-compliance-toolkit" ]
  then
  branch=release-1.3.0
  git clone -b $branch https://github.com/mosip/$REPO_NAME.git ./repos/$REPO_NAME
  elif [ $REPO_NAME == "esignet" ]
  then
  branch=release-1.2.x
  git clone -b $branch https://github.com/mosip/$REPO_NAME.git ./repos/$REPO_NAME
  else
  git clone -b $1 https://github.com/mosip/$REPO_NAME.git ./repos/$REPO_NAME
  fi
  done < ./repo-list.txt

