recipe "ruby", "Installs ruby"

%w{ubuntu debian}.each do |os|
  supports os
end
