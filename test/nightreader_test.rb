require 'minitest/autorun'
require 'minitest/pride'
require './lib/nightreader.rb'

class NightReaderTest < MiniTest::Test

  def test_it_exists
    nightreader = NightReader.new

    assert_instance_of NightReader, nightreader
  end

  

end
