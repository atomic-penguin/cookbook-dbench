#
# Cookbook Name:: dbench
# Recipe:: default
#
# Copyright 2011, Eric G. Wolfe
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['dbench']['install_method']
when "source"
  include_recipe "dbench::source"
when "package"
  case node['platform_family']
  when 'rhel'
    include_recipe "yum::epel"
  end
  node['dbench']['packages'].each do |dbench_pkg|
    package dbench_pkg
  end
else
  node['dbench']['packages'].each do |dbench_pkg|
    package dbench_pkg
  end
end
