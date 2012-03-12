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

case node['platform']
when "redhat","centos","scientific","amazon"
  case node['platform_version'].to_i
  when <= 5

    directory node['dbench']['src_path'] do
      recursive true
      action :create
    end

    include_recipe "git"
    include_recipe "build-essential"

    node['dbench']['pre_reqs'].each do |dbench_requirement|
      package dbench_requirement
    end

    git "#{node['dbench']['src_path']}/dbench" do
      repository node[:dbench][:git_url]
      reference "HEAD"
      action :sync
      not_if {File.exists?("#{node['dbench']['src_path']}/dbench")}
    end

    script "install_dbench" do
      interpreter "bash"
      cwd "#{node['dbench']['src_path']}/dbench"
      code <<-EOH
      ./autogen.sh
      ./configure --prefix=/usr/local
      make
      make install
      EOH
      not_if {File.exists?("/usr/local/bin/dbench")}
    end
  else
    package "dbench"
  end
else
  package "dbench"
end
