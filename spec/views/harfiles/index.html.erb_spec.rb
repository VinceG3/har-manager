require 'rails_helper'

RSpec.describe "harfiles/index", type: :view do
  before(:each) do
    assign(:harfiles, [
      Harfile.create!(
        :name => "Name",
        :contents => "MyText"
      ),
      Harfile.create!(
        :name => "Name",
        :contents => "MyText"
      )
    ])
  end
end
