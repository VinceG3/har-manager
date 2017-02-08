require 'rails_helper'

RSpec.describe 'Upload Manager' do
  describe 'file fixtures' do
    it "reads sample file" do
      expect(file_fixture('sample.har')).to be_a(Pathname)
      expect(file_fixture("sample.txt").read).to eq("Hello")
    end

    it 'reads har file' do
      expect(file_fixture('sample.har').read).to be_a(String)
    end
  end

  describe 'har_json' do
    it 'parses and returns JSON' do
      expect(har_json('sample.har')).to be_a(Hash)
    end
  end
end