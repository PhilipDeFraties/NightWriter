require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer.rb'
require './lib/translator.rb'
require 'pry'

class NightWriterTest < MiniTest::Test

  def test_it_exists
    nightwriter = NightWriter.new

    assert_instance_of NightWriter, nightwriter
  end

  def test_it_has_translator
    nightwriter = NightWriter.new

    assert_instance_of Translator, nightwriter.translator
  end

  def test_it_has_access_to_alphabet
    nightwriter = NightWriter.new

    assert_equal Alphabet, nightwriter.translator.alphabet.class
    assert_equal Hash, nightwriter.translator.alphabet.lowercase.class
  end

  def test_it_can_load_from_command_line_input
    nightwriter = NightWriter.new
    ARGV[0] = 'message.txt'
    nightwriter.load_input_text(ARGV[0])
    assert_equal "hello world\n", nightwriter.text
  end

  def test_it_can_limit_text_width
    nightwriter = NightWriter.new

    text1 = "text text text text text text text text text text text text text text text text "
    text2 = "text text"
    text3 = "text text text text text text text text text text text text text text text"
    text4 = "text text text text text text text text text text text text text text text text text"


    assert_equal 40, nightwriter.cut(text1)[0].length
    assert_equal 40, nightwriter.cut(text1)[1].length
    assert_equal nil, nightwriter.cut(text1)[2]
    assert_equal 9, nightwriter.cut(text2)[0].length
    assert_equal 40, nightwriter.cut(text3)[0].length
    assert_equal 34, nightwriter.cut(text3)[1].length
    assert_equal nil, nightwriter.cut(text3)[2]
    assert_equal 40, nightwriter.cut(text4)[0].length
    assert_equal 40, nightwriter.cut(text4)[1].length
    assert_equal 4, nightwriter.cut(text4)[2].length
  end

  def test_it_can_translate
    nightwriter = NightWriter.new
    text = "hello world"
    nightwriter.cut(text)
    nightwriter.translate
    assert_equal ["0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"],
    nightwriter.output_strings
  end

  def test_it_can_write_translated_braille_to_new_file
    nightwriter = NightWriter.new
    nightwriter.cut("hello world")
    nightwriter.translate
    nightwriter.write('translated1.txt')
    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n",
     File.read('translated1.txt')
  end

  def test_it_can_confirm_translated_characters
    nightwriter = NightWriter.new
    ARGV[0] = 'message.txt'
    ARGV[1] = 'translated2.txt'
    nightwriter.load_input_text(ARGV[0])
    nightwriter.cut(File.read(ARGV[0]))
    nightwriter.translate
    nightwriter.write(ARGV[1])

    assert_equal "Created 'translated2.txt' containing 11 characters",
     nightwriter.confirm(ARGV[0])
  end
end
