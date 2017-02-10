RSpec.feature 'UTF8 bug' do
  # I thought it would be a neat idea to encapsulate bugs into a
  # Bugfix class, and test it. That way if a new version of Rails
  # or a gem or whatever eliminates the need for the fix, the tests
  # could tell us. In this case it's the file upload which seems to
  # automatically make ASCII tempfiles. It would be hard to
  # encapsulate the bugfix into a class, so I gave up on it.
  # Leaving this here so you can see where my head's at.

  xit 'loads the HAR files as UTF8 instead of ASCII' do
    tempfile = Tempfile.new
    tempfile.write(file_fixture('sample.har').read)
    tempfile.close
    tempfile.open
    string = tempfile.read
    binding.pry
  end

  it 'loads as ASCII without the fix'
end