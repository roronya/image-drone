ROLE = 'drone'
USER = ENV['USER']
PRIVATE_KEY = '~/.ssh/google_compute_engine'

Vagrant.configure('2') do |config|
  config.vm.box = 'google/gce'

  config.vm.provider :google do |google, override|
    google.google_project_id = 'roronya-dev'
    google.google_client_email = 'hoge@fuga'

    google.image_family = 'ubuntu-1804-lts'
    google.zone = 'asia-northeast1-a'
    google.zone_config 'asia-northeast1-a' do |instance|
      instance.name = "vg-#{ROLE}-#{USER}"
      instance.machine_tye = 'n1-standard-1'
      instance.preemptible = true
      instance.on_host_maintenance = 'TERMINATE'
      instance.auto_restart = false
      instance.disk_size = 16
    end

    override.ssh.username = USER
    override.ssh.private_key_path = PRIVATE_KEY
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = 'ansible/playbook.yml'
    ansible.extra_vars = {
        env: 'local',
        ansible_ssh_user: USER,
        drone_secret: ENV['DRONE_SECRET'],
        drone_host: ENV['DRONE_HOST'],
        drone_db_user: ENV['DRONE_DB_USER'],
        drone_db_pass: ENV['DRONE_DB_PASS'],
        drone_db_connection_name: ENV['DRONE_DB_CONNECTION_NAME'],
        drone_github_client: ENV['DRONE_GITHUB_CLIENT'],
        drone_github_secret: ENV['DRONE_GITHUB_SECRET'],
    }
  end
end
