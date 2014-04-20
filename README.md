Chef::Sugar::Dip
================
[![Gem Version](http://img.shields.io/gem/v/chef-sugar-dip.svg)][gem]
[![Build Status](http://img.shields.io/travis/JeanMertz/chef-sugar-dip.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/JeanMertz/chef-sugar-dip.svg)][gemnasium]
[![Code Climate](http://img.shields.io/codeclimate/github/JeanMertz/chef-sugar-dip.svg)][codeclimate]
[![Gittip](http://img.shields.io/gittip/JeanMertz.svg)][gittip]

[gem]: https://rubygems.org/gems/chef-sugar-dip
[travis]: http://travis-ci.org/JeanMertz/chef-suguar-dip
[gemnasium]: https://gemnasium.com/JeanMertz/chef-sugar-dip
[codeclimate]: https://codeclimate.com/github/JeanMertz/chef-sugar-dip
[gittip]: https://www.gittip.com/JeanMertz

Chef Sugar Dip is a Gem & Chef Recipe that extends the awesome [Chef Sugar][]
gem made by Seth Vargo. It extends the default sugar of the Chef Sugar gem with
some added helpers.

[Chef Sugar]: https://github.com/sethvargo/chef-sugar

Installation
------------
If you want to develop/hack on chef-sugar-dip, please see the Contributing.md.

If you are using Berkshelf, add `chef-sugar-dip` to your `Berksfile`:

```ruby
cookbook 'chef-sugar-dip'
```

Otherwise, you can use `knife` or download the tarball directly from the
community site:

```ruby
knife cookbook site install chef-sugar-dip
```


Usage
-----
In order to use Chef Sugar Dip in your Chef Recipes, you'll first need to
include it:

```ruby
include_recipe 'chef-sugar-dip::default'
```

Alternatively you can put it in a base role or recipe and it will be included
subsequently.

Requiring the Chef Sugar Dip Gem will automatically extend the Recipe DSL,
`Chef::Resource`, and `Chef::Provider` with helpful convenience methods.

### Module Method
If you are working outside of the Recipe DSL, you can use the module methods
instead of the Recipe DSL. In general, the module methods have the same name as
their Recipe-DSL counterparts, but require the node object as a parameter. For
example:

In a Recipe:

```ruby
# cookbook/recipes/default.rb
private_key = OpenSSL::PKey::RSA.new(
  File.read(file_path('cookbook-name', 'apache/localhost.key.encrypted')),
  node['apache']['key']['password']
).to_pem
```

In a Library as a singleton:

```ruby
# cookbook/libraries/default.rb
def apache_encrypted_private_key
  Chef::Sugar::Cookbook
    .file_path(@node, 'cookbook-name', 'apache/localhost.key.encrypted')
end
```

In a Library as a Mixin:

```ruby
# cookbook/libraries/default.rb
include Chef::Sugar::Cookbook

def apache_encrypted_private_key
  file_path(@node, 'cookbook-name', 'apache/localhost.key.encrypted')
end
```

API
---
### Cookbook
**Note:** All cookbook methods require `cookbook_` to be appended when used in a
recipe.

- `files` - return array of file names present in cookbook
- `templates` - return array of template names present in cookbook
- `file_path` - return absolute path to provided file name
- `metadata` - return Chef::Cookbook::Metadata object
- `root` - return absolute path to provided cookbook

#### Examples
```ruby
cookbook_files('my-cookbook').each do |file_name|
  Chef::Log.debug file_path('my-cookbook', file_name)
end
```

### FileSystem
- `tmp` - return Chef cache path, optionally including appended path

#### Examples
```ruby
remote_file tmp('testfile') do
  source 'http://www.example.com/tempfiles/testfile'
end
```

### IP
- `public_ip` - return public ip of node, even for cloud based nodes

#### Examples
```ruby
template '/tmp/config' do
  variables(ipaddress: public_ip)
end
```

License & Authors
-----------------
- Author: Jean Mertz (jean@mertz.fm)

```text
Copyright 2014 Jean Mertz

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
