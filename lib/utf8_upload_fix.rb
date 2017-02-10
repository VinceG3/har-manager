class UTF8UploadFix
  attr_reader :tempfile
  
  def initialize(tempfile)
    @tempfile = tempfile
  end

  def read
    return nil if tempfile.blank?
    File.open(tempfile.path, 'r:UTF-8', &:read)
  end

  def read_without_fix
    tempfile.read
  end
end