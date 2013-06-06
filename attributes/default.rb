#
# Cookbook Name:: dbench
# Attributes:: default
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

default['dbench']['install_method'] = "package"
default['dbench']['packages'] = %w{ dbench }

case node['platform_family']
when "rhel"
  case node['platform_version'].to_i
  when 4
    default['dbench']['install_method'] = "source"
    default['dbench']['packages'] = %w{ libsmbclient-devel } 
  when 5
    default['dbench']['install_method'] = "source"
    default['dbench']['packages'] = %w{ samba3x }
  else
    default['dbench']['install_method'] = "package"
    default['dbench']['packages'] = %w{ dbench libsmbclient-devel }
  end
when "debian"
  default['dbench']['install_method'] = "package"
  default['dbench']['packages'] = %w{ dbench libsmbclient-dev }
else
  default['dbench']['install_method'] = "package"
  default['dbench']['packages'] = %{ dbench } 
end
