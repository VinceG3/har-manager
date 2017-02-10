require 'rails_helper'

RSpec.describe Harfile, type: :model do
  def load_harfile
    @harfile = Harfile.new(
      name: 'sample',
      contents: JSON.dump(har_json('sample.har'))
    )
  end

  describe '#json_contents' do
    it 'returns a hash of the contents of a HAR' do
      load_harfile
      expect(@harfile.requests).to be_a(Array)
    end
  end

  describe '#requests' do
    it 'returns the right number of requests' do
      load_harfile
      expect(@harfile.requests.count).to eq(6)
    end

    it 'retrieves methods and urls' do
      load_harfile
      expect(@harfile.requests.all?{|req| req.keys == ["method", "url"] }).to be true
    end
  end

  describe '#pretty_contents' do
    it 'generates pretty JSON' do
      load_harfile
      expect(@harfile.pretty_contents).to eq(
        JSON.pretty_generate(@harfile.json_contents)
      )
    end
  end
end
