recipe "mongodb", "Installs mongodb"

%w{ubuntu debian}.each do |os|
  supports os
end
