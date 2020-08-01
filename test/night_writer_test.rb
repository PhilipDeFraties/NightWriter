require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer.rb'
require './lib/translator.rb'

class NightWriterTest < MiniTest::Test

  def test_it_exists
    nightwriter = NightWriter.new

    assert_instance_of NightWriter, nightwriter
  end
end
