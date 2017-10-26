#!/bin/bash

yum install -y patch

echo -n "Detecting Ruby Version: "

ruby=`which ruby`

if [[ $? != 0 ]]; then
  echo -e "You don't have any Ruby install in your system!"
  exit 1
fi

ruby_version=`ruby -v | sed 's/^.* \([0-9]\{1,\}.[0-9]\{1,\}\.[0-9]*\).*$/\1/g'`

if [[ ${ruby_version%.*.*} == "2" ]]; then
  echo -e $ruby_version
else
  echo -e "You are currently using ruby $ruby_version\n"
  echo -e "We are only currently supported only Ruby 2.x.x\n"
  exit 1
fi

echo -e "Installing kitchen.ci using Bundler\n"

bundle install --local

if [[ $? == 0 ]]; then
  echo "Successfully installed test-kitchen with bundler"
else
  echo -e "Failed to install test-kitchen"
  exit 1
fi

CWD=$(pwd)

BERKS=$(gem path berkshelf)
RIDLEY=$(gem path ridley)
KITCHEN=$(gem path kitchen)

echo "Start patching files ..."

cd $BERKS
echo "Patching berkshelf ..."
echo "Using patch file $CWD/berkshelf-v4.3.5_0.patch"
patch -p0 < $CWD/berkshelf-v4.3.5_0.patch

cd $RIDLEY
echo "Patching ridley ..."
echo "Using patch file $CWD/ridley-v4.6.1_0.patch"
patch -p0 < $CWD/ridley-v4.6.1_0.patch

echo "Patching test-kitchen ..."
cd $KITCHEN
echo "Using patch file $CWD/test-kitchen-v1.16.0_0.patch"

patch -p0 < $CWD/test-kitchen-v1.16.0_0.patch

echo "Using patch file $CWD/test-kitchen-v1.16.0_1.patch"
patch -p0 < $CWD/test-kitchen-v1.16.0_1.patch

cd $CWD

echo -e "All done!\n"
