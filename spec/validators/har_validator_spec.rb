require 'rails_helper'

describe HarValidator do
  def make_validator_with_har(content_hash)
    name = 'sample'
    contents = JSON.dump(content_hash)
    @record = Harfile.new(name: name, contents: contents)
    @record.validate
    @errors = @record.errors.messages[:base]
  end

  describe '#no_log?' do
    it 'validates a good record' do
      make_validator_with_har({'log' => 'stupid'})
      expect(@errors).to_not include('Bad HAR, no log found')
    end

    it 'rejects a bad record' do
      make_validator_with_har({'hi' => 'stupid'})
      expect(@errors).to include('Bad HAR, no log found')
    end
  end

  describe '#no_version?' do
    it 'validates a good record' do
      make_validator_with_har({'log' => {'version' => 'stupid'}})
      expect(@errors).to_not include('Bad HAR, no version found')
    end

    it 'rejects a bad record' do
      make_validator_with_har({'log' => {'supplies!' => 'stupid'}})
      expect(@errors).to include('Bad HAR, no version found')
    end
  end

  describe '#no_entries?' do
    it 'validates a good record' do
      make_validator_with_har({'log' => {'entries' => 'stupid'}})
      expect(@errors).to_not include('Bad HAR, no entries found')
    end

    it 'rejects a bad record' do
      make_validator_with_har({'log' => {'supplies!' => 'stupid'}})
      expect(@errors).to include('Bad HAR, no entries found')
    end
  end
end