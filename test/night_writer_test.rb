require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer.rb'
require './lib/translator.rb'
require './lib/file_reader.rb'

class NightWriterTest < MiniTest::Test

  def test_it_exists
    nightwriter = NightWriter.new

    assert_instance_of NightWriter, nightwriter
  end

  def test_it_has_reader_and_translator
    nightwriter = NightWriter.new

    assert_instance_of FileReader, nightwriter.reader
    assert_instance_of Translator, nightwriter.translator
  end

  def test_it

end
