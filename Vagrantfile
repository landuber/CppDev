VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
      config.vm.box = "ubuntu/trusty64"
      config.vm.synced_folder ".", "/usr/local/src/CppDev"

      config.vm.provision :shell do |shell|
         shell.inline = "mkdir -p /etc/puppet/modules;
                         puppet module install puppetlabs-apt;
                         puppet module install puppetlabs-ruby;"
      end

      config.vm.provider "virtualbox" do |v|
        v.memory = 4096
        v.cpus = 2
      end

      config.vm.provision "puppet" do |puppet|
        puppet.options = "--verbose --debug"
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "site.pp"
      end
end
