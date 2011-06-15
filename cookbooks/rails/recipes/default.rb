#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2009, Opscode, Inc.
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

rails = 'gem install rails --no-ri --no-rdoc'
god = 'gem install god --no-ri --no-rdoc'
result = ' '

if (system('rails -v')!=true)
  (result == ' ') ? (result += rails) : (result += " && " + rails)
end

if (%x(gem list |grep capistrano).include? 'capistrano') == false
  (result == ' ') ? (result += capistrano) : (result += " && " + capistrano)
end

if (%x(gem list |grep unicorn).include? 'unicorn') == false
  (result == ' ') ? (result += unicorn) : (result += " && " + unicorn)
end

if (%x(gem list |grep god).include? 'god') == false
  (result == ' ') ? (result += god) : (result += " && " + god)
end

if result != ' '
 system( result )
end