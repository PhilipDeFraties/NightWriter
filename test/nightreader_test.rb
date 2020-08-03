require 'minitest/autorun'
require 'minitest/pride'
require './lib/nightreader.rb'

class NightReaderTest < MiniTest::Test

  def test_it_exists_and_has_input_braille
    nightreader = NightReader.new("single_braille.txt")

    assert_instance_of NightReader, nightreader
    assert_equal "0.\n..\n..\n", nightreader.braille_text
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

  def test_it_can_translate
    nightreader = NightReader.new("encoded.txt")

    assert_equal "close your eyes and see when there aint no light all youll ever be come and save the night cause i dont leave when the morning comes it doesnt seem to say an awful lot to me",
     nightreader.translate

    nightreader = NightReader.new("single_braille.txt")
    
    assert_equal "a", nightreader.translate
  end

end
