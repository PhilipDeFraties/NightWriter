require 'minitest/autorun'
require 'minitest/pride'
require './lib/nightreader.rb'

class NightReaderTest < MiniTest::Test

  def test_it_exists
    nightreader = NightReader.new

    assert_instance_of NightReader, nightreader
  end


  def test_it_has_access_to_translator_and_alphabet
    nightreader = NightReader.new

    assert_instance_of Translator, nightreader.translator
    assert_equal Alphabet, nightreader.translator.alphabet.class
    assert_equal Hash, nightreader.translator.alphabet.rev_lowercase.class
  end

  def test_it_load_input_text
    nightreader = NightReader.new

    ARGV[0] = 'message.txt'
    nightreader.load_input_text(ARGV[0])
    assert_equal "hello world\n", nightreader.text
  end


  def test_it_can_confirm
    nightreader = NightReader.new
    ARGV[0] = 'braille1.txt'
    ARGV[1] = 'message.txt'

    assert_equal "Created 'message.txt' containing 11 characters",
     nightreader.confirm(ARGV[0], ARGV[1])
  end
end
