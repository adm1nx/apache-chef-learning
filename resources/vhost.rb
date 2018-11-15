# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
property :site_name, String, name_property: true
property :site_port, Integer, default: 80

default_action :create

action :create do 
  directory "/srv/apache/#{new_resource.site_name}/html" do
    recursive true
    mode '0755'
  end

  template "/etc/httpd/conf.d/#{new_resource.site_name}.conf" do
    source 'conf.erb'
    mode '0644'
    variables(document_root: "/srv/apache/#{new_resource.site_name}/html", port: new_resource.site_port)
  end

  file "/srv/apache/#{new_resource.site_name}/html/index.html" do
    content "<h1>Welcome #{new_resource.site_name}!</h1>"
  end 
end

action :remove do
  directory "/srv/apache/#{new_resource.site_name}/html" do
    action :delete
  end

  file "/etc/httpd/conf.d/#{new_resource.site_name}.conf" do
    action :delete
  end
end
