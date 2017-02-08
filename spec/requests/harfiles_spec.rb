require 'rails_helper'

RSpec.describe "Harfiles", type: :request do
  describe "GET /harfiles" do
    it "works! (now write some real specs)" do
      get harfiles_path
      expect(response).to have_http_status(200)
    end
  end
end
