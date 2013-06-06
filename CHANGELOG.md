## Version 1.0.4

* Add dependency for yum::epel
* Add test-kitchen skeleton
* Fix minitest-spec for Chef 11.x

## Version 1.0.3

* minor typo 's/defualt/default'

## Version 1.0.2

* Correct samba3x vs. libsmbclient-devel conflict on RHEL5

## Version 1.0.1

Satiate foodcritic

* Add cookbook name to metadata to satiate dependency
  rules in foodcritic.

## Version 1.0.0

Factor out source install
  
* Factor source install_method out of default
* Add attribute sanity checking
* Add Travis-CI and minitest tasks

## Version 0.0.7

* Fix version case switch

## Version 0.0.6

* Change deploy resource to only clone idempotently
* Assume dbench 4 package is good enough for RHEL 6+ and other platforms
