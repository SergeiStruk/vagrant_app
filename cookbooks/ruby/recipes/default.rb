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

#ruby = 'sudo apt-get install build-essential bison openssl libreadline5 libreadline5-dev curl zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libmysqlclient-dev -y && mkdir -p ~/temp/ruby && cd ~/temp/ruby && wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz && tar xzf ruby-1.9.2-p180.tar.gz && cd ruby-1.9.2-p180 && ./configure --enable-pthread --with-ext=bigdecimal,continuation,coverage,curses,dbm,digest,digest/bubblebabble,digest/md5,digest/rmd160,digest/sha1,digest/sha2,dl,etc,fcntl,fiber,fiddle,gdbm,iconv,io,io/nonblock,json,json/generator,json/parser,mathn,mathn/complex,mathn/rational,nkf,nkf/nkf-utf8,objspace,openssl,psych,pty,readline,ripper,sdbm,socket,stringio,strscan,syck,syslog,zlib && make && make install &&sudo gem install fpm && mkdir /tmp/installdir && make install DESTDIR=/tmp/installdir && fpm -s dir -t deb -n ruby1.9.1p180 -v 1.9.2p180 -C /tmp/installdir -p ruby-VERSION_ARCH.deb -d "libssl0.9.8 (>= 0.9.8k-1)" -d "libc6 (>= 2.2.5)" -d "libgdbm3 (>= 1.8.3)" -d "libncurses5 (>= 5.6+20071006-3)" -d "libreadline5 (>= 5.2)" -d "zlib1g (>= 1:1.1.4)" -d "libc6-dev (>= 0)" -d "build-essential (>= 0)"'
app_ssh = 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwu0Mj/YqFDM88UwvTMbEIghiunkEScoMJZ+TDhg+VOI79OY4/+nyNUkbeH/52SFA6apywvJlN6RIkuKpGK+7idjyBT4L17yiS/ZZGvTXJjol04m814TMJveOwftXN7/eb0zUl6nsEJMTOU8EPMd9KSDiVIGki3REOGWO+Ju/Cij163kqvaNQk8SI2m4sAni+RxILsFTrvBdzuzBsyFji0dlVotuXkigYSZry5wfqEVcFaSCA4zGvOby+IPhBCk8YQw94bG+Ta+Ra78mmoysIc5QEP/sVzWk5/FjIGZJxl3SL3Q4jcXXbfjqhRZHPc9NGPdhud8Dla5QwmF0OCuodYw== sst@jetthoughts.com'
add_ssh = 'sudo echo '+ app_ssh + '>> ~/.ssh/authorized_keys '
result = ' ' 

if (%x(cat ~/.ssh/authorized_keys).include? app_ssh ) == false
  (result == ' ') ? (result += add_ssh) : (result += " && " + add_ssh)
end

=begin
if (%x(ruby -v).include? 'ruby 1.9.2p180') == false
  (result == ' ') ? (result += ruby) : (result += " && " + ruby)
end
=end

=begin
if (%x(rails -v).include? 'Rails 3.0.7') == false
  (result == ' ') ? (result += rails) : (result += " && " + rails)
end

if (%x(mongo --version).include? 'MongoDB shell version: 1.6.5') == false
  (result == ' ') ? (result += mongodb) : (result += " && " + mongodb)
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
=end


if result != ' '
 system( result )
end

