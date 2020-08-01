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

  def test_it_has_no_input_or_output_text_by_default
    translator = Translator.new

    assert_equal "", translator.input_text
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

    assert_equal "0.0.00\n..0...\n......", translator.formatted_braille
  end


end
