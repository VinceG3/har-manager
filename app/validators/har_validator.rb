class HarValidator < ActiveModel::Validator
  attr_reader :record

  def validate(record)
    @record = record
    record.errors.add :base, 'Bad HAR, no log found' if no_log?
    record.errors.add :base, 'Bad HAR, no version found' if no_version?
    record.errors.add :base, 'Bad HAR, no entries found' if no_entries?
  end

  def json
    record.json_contents
  end

  def no_log?
    json.dig('log').blank? rescue false
  end

  def no_version?
    json.dig('log', 'version').blank? rescue false
  end

  def no_entries?
    json.dig('log', 'entries').blank? rescue false
  end
end