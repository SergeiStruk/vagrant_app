sudo apt-get update 
sudo apt-get install ruby wget ssl-cert git-core -y
mkdir rubygems
pushd rubygems
sudo apt-get install subversion -y
svn checkout svn://rubyforge.org/var/svn/rubygems/trunk
cd trunk
sudo ruby setup.rb
sudo gem install chef
cd /tmp/ 
git clone git://github.com/SergeiStruk/vagrant_app1.git  
sudo chef-solo -c /tmp/vagrant_app1/solo.rb -j /tmp/vagrant_app1/node.json