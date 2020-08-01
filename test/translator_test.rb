require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator.rb'


class TranslatorTest < MiniTest::Test

  def test_it_exists
    translator = Translator.new

    assert_instance_of Translator, translator
  end



  def test_it_can_translate_to_braille
    translator = Translator.new
    text = "test text"
    assert_equal [[".0", "00", "0."],
     ["0.", ".0", ".."], [".0", "0.", "0."],
      [".0", "00", "0."], ["..", "..", ".."],
       [".0", "00", "0."], ["0.", ".0", ".."],
        ["00", "..", "00"], [".0", "00", "0."]],
         translator.translate_to_braille_arrays(text)
  end

end
