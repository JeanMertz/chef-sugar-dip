chef_gem('chef-sugar-dip') do
  version '1.0.0'
  source run_context.cookbook_collection['dip-cookbook']
    .preferred_filename_on_disk_location(node, :files, 'chef-sugar-dip-1.0.0.gem')
  action  :nothing
end.run_action(:install)

require 'chef/sugar/dip'
