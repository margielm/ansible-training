Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/vivid64"
  config.vm.provision :shell, path: "bootstrap.sh"

  #config.vm.synced_folder "../deployment_synchronizer", "/synchronizer"
end
