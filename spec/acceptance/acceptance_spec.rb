RSpec.describe 'Prototype' do
  describe 'RESTful calls for all 4 CRUD operations applying to entire HAR files' do
    it 'Create a HAR file: upload the contents of a HAR file to an internal store'
    it 'Read a HAR file: return the contents of an existing HAR file from the internal store'
    it 'Update a HAR file: replace old HAR file with new HAR file in the internal store'
    it 'Delete a HAR file: delete an existing HAR file from the internal store'
  end

  describe 'Perform basic validation that the input file conforms to the H  AR 1.2 Spec.' do
    it 'validates basic fields'
  end
end

RSpec.describe 'Accessing HAR File Contents' do
  xdescribe 'GET interface to return all the “request” resources from a specific HAR file ' do
    it 'returns JSON request objects'
    it 'returns the method on each request'
    it 'returns the url on each request'
  end

  xdescribe 'GET interface to load one specific resource, indexed by 0-based position'
end