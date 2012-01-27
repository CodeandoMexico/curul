Vagrant::Config.run do |config|
  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"
  config.vm.network :hostonly, "33.33.33.10"
  config.vm.forward_port 5432, 5432

  config.vm.provision :chef_solo do |chef|
     chef.recipe_url = "https://github.com/crowdint/vagrant-setup/raw/master/downloads/cookbooks.tar.gz"
     chef.add_recipe "general"
     chef.add_recipe "general::utils"
     chef.add_recipe "postgresql"
  end


  config.vm.customize ["modifyvm", :id, "--memory", "512"]

end
