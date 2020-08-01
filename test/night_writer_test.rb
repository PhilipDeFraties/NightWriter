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

  def test_it_has_access_to_alphabet
    nightwriter = NightWriter.new

    assert_equal Alphabet, nightwriter.translator.alphabet.class
    assert_equal Hash, nightwriter.translator.alphabet.lowercase.class
  end

  def test_it_can_read_from_command_line_input
    nightwriter = NightWriter.new
    ARGV[0] = 'message.txt'
    assert_equal "hello world\n", nightwriter.reader.read(ARGV[0])
  end

end