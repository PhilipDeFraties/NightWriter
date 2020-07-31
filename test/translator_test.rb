require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator.rb'

class TranslatorTest < MiniTest::Test

  def test_it_exists
    translator = Translator.new('message.txt')

    assert_instance_of Translator, translator
  end


  def test_it_can_print_from_eng_file
    translator = Translator.new('message.txt')

    assert_equal "hello world\n", translator.read_from_english_file
  end

end
