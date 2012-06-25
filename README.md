# dbench [![Build Status](https://secure.travis-ci.org/atomic-penguin/cookbook-dbench.png?branch=master)](http://travis-ci.org/atomic-penguin/cookbook-dbench)

## Description

  I've found that dbench version 3 on RHEL 5 returns innacurate results.
This cookbook clones dbench version 4 from Samba.org, compiles from source
and installs dbench in /usr/local.

## Requirements

### Required Cookbooks

  * git
  * build-essential

## Attributes

  * `dbench['src_path']` - defaults to /usr/src
  * `dbench['git_url']` - git tree according to http://dbench.samba.org/web/download.html
  * `dbench['install_method']` - `source` or `package`
  * `dbench['packages']` - dbench binary package, or source build dependency packages.

## Usage

  Add `recipe[dbench]` to `run_list`

## License and Author

Copyright 2011, Eric G. Wolfe

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

