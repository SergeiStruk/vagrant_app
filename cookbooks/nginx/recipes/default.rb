=begin
nginx = ['sudo apt-get install nginx -y',
  'sudo mv  /tmp/vagrant_app1/cookbooks/nginx/nginx.conf /etc/nginx/',
  'sudo mv  /tmp/vagrant_app1/cookbooks/nginx/nxdissite /usr/sbin/',
  'sudo mv  /tmp/vagrant_app1/cookbooks/nginx/nxensite /usr/sbin/',
  'sudo mv  /tmp/vagrant_app1/cookbooks/nginx/default /etc/nginx/sites-available/'
  ]

nginx.each{|x| system(x) }
=end


package "nginx"
#nginx='sudo apt-get install nginx -y'
#system(nginx)

directory node[:nginx][:log_dir] do
  mode 0755
  owner node[:nginx][:user]
  action :create
end

%w{nxensite nxdissite}.each do |nxscript|
  template "/usr/sbin/#{nxscript}" do
    source "#{nxscript}.erb"
    mode 0755
    owner "root"
    group "root"
  end
end

template "nginx.conf" do
  path "#{node[:nginx][:dir]}/nginx.conf"
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 0644
end
=begin
template "#{node[:nginx][:dir]}/sites-available/default" do
  source "default-site.erb"
  owner "root"
  group "root"
  mode 0644
end
=end
service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

