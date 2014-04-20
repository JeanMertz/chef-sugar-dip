require 'spec_helper'

describe Chef::Sugar::Cookbook do
  it_behaves_like 'a chef sugar'

  let(:chef_instance) { ChefSpec::Runner.new }
  let(:chef_run) { chef_instance.converge('dip-cookbook::default') }

  context '#files' do
    it 'returns the list of cookbook files' do
      expect(described_class.files(chef_run.node, 'dip-cookbook').last)
        .to include('files/default/test.json')
    end
  end

  context '#templates' do
    it 'returns the list of cookbook templates' do
      expect(described_class.templates(chef_run.node, 'dip-cookbook').last)
        .to include('templates/default/test.json.erb')
    end
  end

  context '#file_path' do
    it 'returns the absolute path of a requested file' do
      expect(described_class
        .file_path(chef_run.node, 'dip-cookbook', 'test.json'))
        .to include('files/default/test.json')
    end
  end

  context '#metadata' do
    it 'returns a Chef::Cookbook::Metadata object' do
      expect(described_class.metadata(chef_run.node, 'dip-cookbook'))
        .to be_instance_of Chef::Cookbook::Metadata
    end
  end

  context '#root' do
    it 'returns the absolute path of the cookbook' do
      expect(described_class.root(chef_run.node, 'dip-cookbook'))
        .to include('cookbooks/dip-cookbook')
    end
  end

  # context 'without any arguments' do
  #   it 'returns the default Chef cache path' do
  #     expect(described_class.tmp).to eq('/chef/cache')
  #   end
  # end
  #
  # context 'with a custom path as argument' do
  #   it 'merges default Chef cache path with provided argument' do
  #     expect(described_class.tmp('my/path')).to eq('/chef/cache/my/path')
  #   end
  # end
end
