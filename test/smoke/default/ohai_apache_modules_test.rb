# # encoding: utf-8

# Inspec test for recipe apache::ohai_apache_modules

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
plugin_directory = '/tmp/kitchen/ohai/plugins'

describe command("ohai -d #{plugin_directory} apache") do 
  its(:stdout) { should match(/core_module/) }
end
