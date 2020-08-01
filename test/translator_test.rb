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

    assert_equal "0.0.00\n..0...\n......", translator.formatted_braille
  end

  def test_it_can_limit_text_width
    translator = Translator.new
    text1 = "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text "
    text2 = "text text"
    text3 = "text text text text text text text text text text text text text text text text text text text text text text text text text"
    text4 = "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text"


    assert_equal 80, translator.cut(text1)[0].length
    assert_equal 80, translator.cut(text1)[1].length
    assert_equal 9, translator.cut(text2)[0].length
    assert_equal 80, translator.cut(text3)[0].length
    assert_equal 44, translator.cut(text3)[1].length
    assert_equal 80, translator.cut(text4)[0].length
    assert_equal 80, translator.cut(text4)[1].length
    assert_equal 39, translator.cut(text4)[2].length
  end


end
