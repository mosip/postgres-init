#!/usr/bin/env bash

while IFS= read -r line; do
REPO_NAME=$line
if [ -z $line ]; then
  continue;
fi
if  [ $REPO_NAME == "resident-services" ]
then
echo $REPO_NAME
branch=1.2.0.1-B2
git clone -b $branch https://github.com/mosip/$REPO_NAME.git ./repos/$REPO_NAME
elif [ $REPO_NAME == "mosip-compliance-toolkit" ]
then
branch=v0.0.9
git clone -b $branch https://github.com/mosip/$REPO_NAME.git ./repos/$REPO_NAME
elif [ $REPO_NAME == "digital-card-service" ]
then
branch=develop
git clone -b $branch https://github.com/mosip/$REPO_NAME.git ./repos/$REPO_NAME
elif [ $REPO_NAME == "esignet" ]
then
branch=1.0.0
git clone -b $branch https://github.com/mosip/$REPO_NAME.git ./repos/$REPO_NAME
elif [ $REPO_NAME == "esignet-mock-services" ]
then
branch=0.9.0
git clone -b $branch https://github.com/mosip/$REPO_NAME.git ./repos/$REPO_NAME
else
git clone -b $1 https://github.com/mosip/$REPO_NAME.git ./repos/$REPO_NAME
fi
done < ./repo-list.txt
