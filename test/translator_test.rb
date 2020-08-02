require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator.rb'


class TranslatorTest < MiniTest::Test

  def test_it_exists
    translator = Translator.new

    assert_instance_of Translator, translator
  end

  def test_it_has_alphabet
    translator = Translator.new

    assert_instance_of Alphabet, translator.alphabet
    assert_equal Hash, translator.alphabet.lowercase.class
    assert_equal ["0.", "..", ".."], translator.alphabet.lowercase["a"]
    assert_equal ["00", "..", "0."],translator.alphabet.lowercase["m"]
    assert_equal [".0", "0.", "0."],translator.alphabet.lowercase["s"]
    assert_equal [".0", "00", ".0"],translator.alphabet.lowercase["w"]
    assert_equal ["..", "..", ".."],translator.alphabet.lowercase[" "]
  end

  def test_it_has_no_output_text_by_default
    translator = Translator.new


    assert_equal "", translator.formatted_braille
  end

  def test_it_can_translate_to_braille_arrays
    translator = Translator.new
    text = "test text"
    assert_equal [[".0", "00", "0."],
     ["0.", ".0", ".."], [".0", "0.", "0."],
      [".0", "00", "0."], ["..", "..", ".."],
       [".0", "00", "0."], ["0.", ".0", ".."],
        ["00", "..", "00"], [".0", "00", "0."]],
         translator.translate_to_braille_arrays(text)
  end

  def test_it_can_format_braille
    translator = Translator.new
    text = "abc"

    translator.translate_to_braille_arrays(text)
    translator.format_to_braille

    assert_equal "0.0.00\n..0...\n......\n", translator.formatted_braille
  end

  def test_it_can_translate_arrays
    translator = Translator.new

    arrays = [["0.", "..", ".."]]

    assert_equal "a", translator.translate_from_braille_arrays(arrays)
  end

  def test_it_can_split_lines
    translator = Translator.new

    text = "0.\n..\n..\n"
    text2 = "0.0.\n..00\n00..\n"
    text3 = "0.0.\n..00\n00..\n.0.0\n00..\n..00\n"

    assert_equal ["0.", "..", ".."], translator.split_braille_lines(text)
    assert_equal ["0.0.", "..00", "00.."], translator.split_braille_lines(text2)
    assert_equal ["0.0.", "..00", "00..", ".0.0", "00..", "..00"],
     translator.split_braille_lines(text3)
  end

  # def test_it_can_group_lines
  # translator = Translator.new
  #
  # array = ["0.0.", "..00", "00..", ".0.0", "00..", "..00"]
  #
  # assert_equal [["0.0.", "..00", "00.."], [".0.0", "00..", "..00"]], translator
end
