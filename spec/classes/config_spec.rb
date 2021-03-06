require 'spec_helper'
describe 'caddy::config' do
  context 'with default values for Redhat family release 6' do
    let(:facts) do
      {
        os: {
          family: 'RedHat',
          name: 'RedHat',
          release: {
            major: '6'
          },
          architecture: 'x86_64'
        }
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_file('/etc/caddy') }
    it { is_expected.to contain_file('/etc/caddy/Caddyfile') }
    it { is_expected.to contain_file('/etc/caddy/config') }
    it { is_expected.to contain_file('/var/log/caddy') }
    it { is_expected.to contain_user('caddy') }
    it { is_expected.to contain_group('caddy') }
    it { is_expected.to contain_file('/etc/init.d/caddy') }
  end
  context 'with default values for Redhat family release 7' do
    let(:facts) do
      {
        os: {
          family: 'RedHat',
          name: 'RedHat',
          release: {
            major: '7'
          },
          architecture: 'x86_64'
        },
        path: '/usr/bin:/usr/sbin:/bin:/usr/local/bin'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_systemd__unit_file('caddy.service') }
  end
  context 'with default values for Debian family, Ubuntu 18.04' do
    let(:facts) do
      {
        os: {
          family: 'Debian',
          name: 'Ubuntu',
          release: {
            major: '18.04'
          },
          architecture: 'x86_64'
        },
        path: '/usr/bin:/usr/sbin:/bin:/usr/local/bin'
      }
    end

    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_systemd__unit_file('caddy.service') }
    it { is_expected.to contain_file('/etc/caddy/Caddyfile') }
    it { is_expected.to contain_file('/etc/caddy/config') }
    it { is_expected.to contain_user('www-data') }
    it { is_expected.to contain_group('www-data') }
  end
end
