#
# Cookbook Name:: nfs
# Test:: attributes_spec 
#
# Author:: Fletcher Nichol
# Author:: Eric G. Wolfe
#
# Copyright 2012, Fletcher Nichol
# Copyright 2012, Eric G. Wolfe
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
require File.join(File.dirname(__FILE__), %w{.. support spec_helper})
require 'chef/node'
require 'chef/platform'

describe 'Dbench::Attributes::Default' do
  let(:attr_ns) { 'dbench' }

  before do
    @node = Chef::Node.new
    @node.consume_external_attrs(Mash.new(ohai_data), {})
    @node.from_file(File.join(File.dirname(__FILE__), %w{.. .. attributes default.rb}))
  end

  describe "for unknown platform" do
    let(:ohai_data) do
      { :platform => "unknown", :platform_version => "3.14" }
    end

    it "installs dbench by package" do
      @node[attr_ns]['install_method'].must_equal "package"
    end

    it "sets a package list including dbench" do
      @node[attr_ns]['packages'].must_include "dbench"
    end
  end

  describe "for centos 5 platform" do
    let(:ohai_data) do
      { :platform => "centos", :platform_version => "5.7" }
    end

    it "installs dbench from source" do
      @node[attr_ns]['install_method'].must_equal "source"
    end

    it "installs the libsmbclient build dependency" do
      @node[attr_ns]['packages'].must_include "samba3x"
    end
  end

  describe "for ubuntu 10 platform" do
    let(:ohai_data) do
      { :platform => "ubuntu", :platform_version => "10.04" }
    end

    it "installs dbench from package" do
      @node[attr_ns]['install_method'].must_equal "package"
    end

    it "installs the libsmbclient build dependency and dbench package" do
      @node[attr_ns]['packages'].sort.must_equal %w{ libsmbclient-dev dbench }.sort
    end

  end
end
