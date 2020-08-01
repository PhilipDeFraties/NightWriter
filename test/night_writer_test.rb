require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer.rb'
require './lib/translator.rb'
require './lib/file_reader.rb'
require 'pry'

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
    nightwriter.load_input_text(ARGV[0])
    assert_equal "hello world\n", nightwriter.text
  end

  def test_it_can_translate
    nightwriter = NightWriter.new
    ARGV[0] = 'message.txt'
    nightwriter.load_input_text(ARGV[0])
    nightwriter.translate
    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...",
     nightwriter.output_text
  end
  def test_it_can_write_translated_braille_to_new_file
    nightwriter = NightWriter.new
    ARGV[0] = 'message.txt'
    ARGV[1] = 'translated.txt'
    nightwriter.load_input_text(ARGV[0])
    nightwriter.translate
    nightwriter.write(ARGV[1])

    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...",
     nightwriter.reader.read(ARGV[1])
  end

  def test_it_can_confirm_translated_characters
    nightwriter = NightWriter.new
    ARGV[0] = 'message.txt'
    ARGV[1] = 'translated.txt'
    nightwriter.load_input_text(ARGV[0])
    nightwriter.translate
    nightwriter.write(ARGV[1])

    assert_equal "Created 'translated.txt' containing 11 characters",
     nightwriter.confirm(ARGV[0])
  end


end
