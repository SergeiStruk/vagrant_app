sudo apt-get update 
sudo apt-get install curl wget ssl-cert git-core -y
#sudo apt-get install build-essential bison openssl libreadline5 libreadline5-dev curl zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev  libxml2-dev libmysqlclient-dev -y && mkdir -p ~/temp/ruby && cd ~/temp/ruby && wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz && tar xzf ruby-1.9.2-p180.tar.gz && cd ruby-1.9.2-p180 && ./configure --enable-pthread --with-ext=bigdecimal,continuation,coverage,curses,dbm,digest,digest/bubblebabble,digest/md5,digest/rmd160,digest/sha1,digest/sha2,dl,etc,fcntl,fiber,fiddle,gdbm,iconv,io,io/nonblock,json,json/generator,json/parser,mathn,mathn/complex,mathn/rational,nkf,nkf/nkf-utf8,objspace,openssl,psych,pty,readline,ripper,sdbm,socket,stringio,strscan,syck,syslog,zlib && make && make install &&sudo gem install fpm && mkdir /tmp/installdir && make install DESTDIR=/tmp/installdir && fpm -s dir -t deb -n ruby1.9.1p180 -v 1.9.2p180 -C /tmp/installdir -p ruby-VERSION_ARCH.deb -d "libssl0.9.8 (>= 0.9.8k-1)" -d "libc6 (>= 2.2.5)" -d "libgdbm3 (>= 1.8.3)" -d "libncurses5 (>= 5.6+20071006-3)" -d "libreadline5 (>= 5.2)" -d "zlib1g (>= 1:1.1.4)" -d "libc6-dev (>= 0)" -d "build-essential (>= 0)"

bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
source .bash_profile
sudo /usr/bin/apt-get install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev -y
rvm install 1.9.2
rvm use 1.9.2
rvm use 1.9.2 --default


gem install chef
cd /tmp/ 
#git clone git://github.com/SergeiStruk/vagrant_app1.git  
#chef-solo -c /tmp/vagrant_app1/solo.rb -j /tmp/vagrant_app1/node.json