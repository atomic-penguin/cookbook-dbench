maintainer       "Eric G. Wolfe"
maintainer_email "wolfe21@marshall.edu"
license          "Apache 2.0"
description      "Compiles and Installs dbench from source"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
depends          "git"
depends          "build-essential"
%w{ redhat centos scientific ubuntu debian }.each do |os|
  supports os, ">= 5.0"
end
