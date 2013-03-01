Vagrant::Config.run do |config|
  config.vm.customize ["modifyvm", :id, "--name", "mongodb_course", "--memory", "512"]
  config.vm.box = "precise64"
  config.vm.host_name = "mongodb-course"
  config.vm.forward_port 22, 2222, :auto => true
  config.vm.forward_port 27017, 27017
  config.vm.network :hostonly, "33.33.13.37"
  config.vm.share_folder "puppet", "/etc/puppet", "puppet"
  config.vm.share_folder "work", "~/M101J/", "../M101J_homework"
end