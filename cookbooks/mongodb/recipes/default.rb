#
# Cookbook Name:: sqlite
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
#exec "wget --no-check-certificate https://github.com/SergeiStruk/railsready/raw/master/railsready.sh && bash railsready.sh.14"

#exec "bash railsready.sh"

#exec "sudo apt-get install git-core -y && sudo apt-get -y install curl && sudo curl https://github.com/joshfng/railsready/raw/master/railsready.sh >> railsready.sh && sudo chmod a+x railsready.sh && sudo ./railsready.sh -y"

#exec 'sudo apt-get install git-core -y && sudo apt-get install curl -y  && sudo apt-get update -y && cd ruby-src && wget ftp://ftp.ruby-lang.org//pub/ruby/1.9/ruby-1.9.2-p180.tar.gz  && tar -zxvf ruby-1.9.2-p180.tar.gz  && cd ruby-1.9.2-p180 && ./configure && sudo apt-get install make -y && make && sudo make install &&  sudo gem install rails '

mongodb = 'sudo echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list && sudo apt-get update && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 && sudo apt-get install mongodb-10gen -y'
result = ' '
if (system('mongo --version')!=true)
  (result == ' ') ? (result += mongodb) : (result += " && " + mongodb)
end

system( result )


