#!/bin/bash
echo "downloading aws-s3 and parallel and i18n"
/opt/chef/embedded/bin/gem install aws-s3 -v 0.6.3
/opt/chef/embedded/bin/gem install parallel -v 1.11.2
/opt/chef/embedded/bin/gem install i18n -v 0.7.0
echo "Done"
