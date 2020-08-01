class FileReader

  def read
    referenced_file = (ARGV[0])
    File.read(ARGV[0])
  end

end
