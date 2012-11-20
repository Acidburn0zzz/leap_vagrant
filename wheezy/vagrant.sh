# Set up Vagrant.

date > /etc/vagrant_box_build_time

# Create the user vagrant with password vagrant
useradd -G sudo -p $(perl -e'print crypt("vagrant", "vagrant")') -m -s /bin/bash -N vagrant

# Install vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys \
  'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# setup vagrant low security ssh public key to be able to connect as root
mkdir /root/.ssh
cp /home/vagrant/.ssh/authorized_keys /root/.ssh
chown -R root:root /root/.ssh
chmod 0700 /root/.ssh
chmod 0600 /root/.ssh/authorized_keys


# Customize the message of the day
echo 'Welcome to your Vagrant-built virtual machine.' > /var/run/motd


