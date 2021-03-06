class Harfile < ApplicationRecord
  validates_with HarValidator

  def json_contents
    JSON.parse(contents)
  end

  def pretty_contents
    JSON.pretty_generate(json_contents)
  end

  def requests
    json_contents
      .dig('log', 'entries')
      .collect do |entry|
        entry
          .dig('request')
          .slice('method', 'url')
      end
  end
end
