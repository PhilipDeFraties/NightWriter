require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator.rb'

class TranslatorTest < MiniTest::Test

  def test_it_exists
    translator = Translator.new

    assert_instance_of Translator, translator
  end


  def test_it_can_read_input_text
    translator = Translator.new

    translator.read('message.txt')

    assert_equal "hello world\n", translator.input_text
  end


end
