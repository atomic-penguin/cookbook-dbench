maintainer       "Eric G. Wolfe"
maintainer_email "wolfe21@marshall.edu"
license          "Apache 2.0"
description      "Installs dbench 4.0 from package or source"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
name             "dbench"
version          "1.0.4"
depends          "git"
depends          "build-essential"
depends          "yum"
%w{ redhat centos scientific amazon oracle ubuntu debian }.each do |os|
  supports os
end
