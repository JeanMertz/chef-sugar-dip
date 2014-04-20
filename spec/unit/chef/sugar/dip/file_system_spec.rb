require 'spec_helper'

describe Chef::Sugar::FileSystem do
  it_behaves_like 'a chef sugar'

  before do
    allow(Chef::Config).to receive(:[]).with(:file_cache_path) { '/chef/cache' }
  end

  context 'without any arguments' do
    it 'returns the default Chef cache path' do
      expect(described_class.tmp).to eq('/chef/cache')
    end
  end

  context 'with a custom path as argument' do
    it 'merges default Chef cache path with provided argument' do
      expect(described_class.tmp('my/path')).to eq('/chef/cache/my/path')
    end
  end
end
