require 'spec_helper'

describe Chef::Sugar::IP do
  it_behaves_like 'a chef sugar'

  let(:node)  { { 'ipaddress' => '1.2.3.4' } }

  context 'when not on a cloud' do
    it 'returns the default IP address' do
      expect(described_class.public_ip(node)).to eq('1.2.3.4')
    end
  end

  context 'when the target is on the cloud' do
    before do
      node['cloud'] = {}
      node['cloud']['public_ipv4'] = '13.14.15.16'
    end

    it 'uses the public ipv4' do
      expect(described_class.public_ip(node)).to eq('13.14.15.16')
    end
  end
end
