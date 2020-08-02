require 'minitest/autorun'
require 'minitest/pride'
require './lib/nightreader.rb'

class NightReaderTest < MiniTest::Test

  def test_it_exists_and_has_input_braille
    nightreader = NightReader.new("single_braille.txt")

    assert_instance_of NightReader, nightreader
  end


  def test_it_has_access_to_translator_and_alphabet
    nightreader = NightReader.new("single_braille.txt")

    assert_instance_of Translator, nightreader.translator
    assert_equal Alphabet, nightreader.translator.alphabet.class
    assert_equal Hash, nightreader.translator.alphabet.rev_lowercase.class
  end

  def test_it_can_confirm
    nightreader = NightReader.new("braille1.txt")
    ARGV[0] = 'braille1.txt'
    ARGV[1] = 'message.txt'

    assert_equal "Created 'message.txt' containing 11 characters",
     nightreader.confirm(ARGV[0], ARGV[1])
  end

  def test_it_can_gather_braille_arrays
    nightreader = NightReader.new("single_braille.txt")
    ARGV[0] = "single_braille.txt"

    assert_equal ["0.", "..", ".."], nightreader.gather_braille_arrays(ARGV[0])
  end
end
