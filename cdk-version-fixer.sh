#!/bin/bash
#
# cdk-version-fixer.sh
# Bumps version of all AWS CDK depedencies and the global one
# This script will nuke your node_modules, package-lock.json file and global aws-cdk cli and attempt to solve 3/4 of
# errors that can be shown in CDK.
# @author: pizzaminded <mikolajczajkowsky@gmail.com>
# @license: MIT

echo "I am in $(pwd)"
echo "I am going to rm your vendors"
rm -rf node_modules package-lock.json
echo "I am going to bump your global aws-cdk"
npm install -g aws-cdk
CDK_GLOBAL_VERSION=$(cdk version | awk '{print $1}')
echo "And i am going to bump CDK vendors in your package.json to $CDK_GLOBAL_VERSION"
CDK_PACKAGES=$(cat package.json | grep '@aws-cdk' | awk '{print $1}' | tr -d ":" | tr -d '"')

for package in $CDK_PACKAGES
do
  npm install --save $package@$CDK_GLOBAL_VERSION
done
echo "Done"
