#
# Cookbook Name:: chef-sugar-dip
# Recipe:: default
#
# Copyright 2013-2014, Jean Mertz <jean@mertz.fm>
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

chef_gem('chef-sugar-dip') do
  version '1.0.0'
  action  :nothing
end.run_action(:install)

require 'chef/sugar/dip'
