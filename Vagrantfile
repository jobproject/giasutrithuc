# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "lucid32"
  config.vm.forward_port 80, 9500

  apt_cache = "./apt-cache"
  if File.directory?(apt_cache)
    config.vm.share_folder "apt_cache", "/var/cache/apt/archives", apt_cache
  end

  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

  FileUtils.mkpath("./protected/runtime")
  FileUtils.chmod_R 0777, ["./protected/runtime"]

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = [
      "chef/chef-cookbooks",
      "chef/site-cookbooks",
    ]
    chef.add_recipe "vagrant"
    chef.json = {
      :giasu => {
        :root_dir => "/vagrant",
        :log_dir => "/vagrant/protected/runtime",
        :yii_path => "/opt/yii/framework/yii.php",
        :db => {
            :user => "giasu",
            :password => "secret",
        },
      },
      :mysql => {
          :server_root_password => 'secret',
      },
    }
  end
end
