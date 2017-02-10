require 'rails_helper'

RSpec.feature 'Acceptance' do
  def make_sample
    @harfile = Harfile.create(
      name: 'sample',
      contents: JSON.dump(har_json('sample.har'))
    )
  end

  def load_and_save_expecting(content)
      visit('/harfiles/new')
      fill_in('Name', with: 'Sample')
      attach_file('HAR File', file_fixture(@fixture_path))
      click_button('Create Harfile')
      expect(page).to have_content(content)
  end

  feature 'Prototype' do
    describe 'RESTful calls for all 4 CRUD operations applying to entire HAR files' do
      describe 'Create a HAR file' do
        it 'uploads the contents of a HAR file to an internal store' do
          visit('/harfiles/new')
          fill_in('Name', with: 'Sample')
          attach_file('HAR File', file_fixture('sample.har'))
          click_button('Create Harfile')
          expect(page).to have_content('Sample')
        end
      end

      describe 'Read a HAR file' do
        it 'returns the contents of an existing HAR file from the internal store' do
          make_sample
          visit('/harfiles/1')
          expect(page).to have_content('sample')
        end
      end

      describe 'Update a HAR file' do
        it 'replaces old HAR file with new HAR file in the internal store' do
          make_sample
          visit('/harfiles/1/edit')
          fill_in('Name', with: 'Updated')
          attach_file('HAR File', file_fixture('updated.har')) 
          click_button('Update Harfile')
          visit('/harfiles/1')
          expect(page).to have_content('https://github.com/teamcapybara/capybara')
        end
      end

      describe 'Delete a HAR file' do
        it 'deletes an existing HAR file from the internal store' do
          make_sample
          visit('/harfiles')
          click_link('Destroy')
          visit('/harfiles')
          expect(page).to_not have_content('sample')
        end
      end
    end

    describe 'Perform basic validation that the input file conforms to the H  AR 1.2 Spec.' do
      it 'validates version' do
        @fixture_path = 'no_version.har'
        load_and_save_expecting('Bad HAR, no version found')
      end

      it 'validates entries' do
        @fixture_path = 'no_entries.har'
        load_and_save_expecting('Bad HAR, no entries found')
      end

      it 'validates log' do
        @fixture_path = 'no_log.har'
        load_and_save_expecting('Bad HAR, no log found')
      end
    end
  end

  describe 'Accessing HAR File Contents' do
    describe 'GET interface to return all the “request” resources from a specific HAR file ' do
      it 'returns JSON request objects' do
        make_sample
        visit('/harfiles/1/requests')
        expect(page).to have_content('requests')
      end

      it 'returns the method on each request' do
        make_sample
        visit('/harfiles/1/requests')
        expect(page).to have_content('POST')
      end

      it 'returns the url on each request' do
        make_sample
        visit('/harfiles/1/requests')
        expect(page).to have_content('https://www.quora.com/webnode2/server_call_POST')
      end
    end

    describe 'GET interface to load one specific resource, indexed by 0-based position' do
      it 'has the right content' do
        make_sample
        visit('/harfiles/1/requests/1')
        expect(page).to have_content('https://log.quora.com/ajax/batched_log_POST')
      end
    end
  end

  describe 'Use ElasticSearch to store Harfiles'
  describe 'Use Bootstrap for page styling'
end
