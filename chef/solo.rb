this_dir = File.expand_path(File.dirname(__FILE__))

cookbook_path [
    "#{this_dir}/site-cookbooks",
    "#{this_dir}/chef-cookbooks",
]

role_path [
    "#{this_dir}/chef-repo/roles",
]
