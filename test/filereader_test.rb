require 'minitest/autorun'
require 'minitest/pride'
require './lib/filereader.rb'

class FileReaderTest < MiniTest::Test

  def test_it_exists
    filereader = FileReader.new

    assert_instance_of FileReader, filereader
  end

end
