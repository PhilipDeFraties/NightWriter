require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_reader.rb'

class FileReaderTest < MiniTest::Test

  def test_it_exists
    filereader = FileReader.new

    assert_instance_of FileReader, filereader
  end

  def test_it_can_read
    filereader = FileReader.new
    ARGV[0] = 'message.txt'
    assert_equal "hello world\n", filereader.read(ARGV[0])
  end
end
