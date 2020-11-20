require './test/test_helper.rb'
require './lib/night_writer.rb'
require './lib/translator.rb'
require 'pry'

class NightWriterTest < MiniTest::Test

  def test_it_exists
    nightwriter = NightWriter.new('fixtures/message.txt', 'message2.txt')

    assert_instance_of NightWriter, nightwriter
  end

  def test_it_has_translator
    nightwriter = NightWriter.new('fixtures/message.txt', 'message2.txt')

    assert_instance_of Translator, nightwriter.translator
  end

  def test_it_has_input_and_output_files
    nightwriter = NightWriter.new('fixtures/message.txt', 'message2.txt')

    assert_equal 'fixtures/message.txt', nightwriter.file_input
    assert_equal 'message2.txt', nightwriter.file_output
  end

  def test_it_loads_input_text
    nightwriter = NightWriter.new('fixtures/message.txt', 'message2.txt')

    assert_equal "hello world", nightwriter.text
  end

  def test_it_can_limit_text_width
    nightwriter = NightWriter.new('fixtures/80eng.txt', 'message2.txt')

    assert_equal 40, nightwriter.cut[0].length
    assert_equal 40, nightwriter.cut[1].length
    assert_equal nil, nightwriter.cut[2]

    nightwriter = NightWriter.new('fixtures/9eng.txt', 'message2.txt')
    assert_equal 9, nightwriter.cut[0].length

    nightwriter = NightWriter.new('fixtures/74eng.txt', 'message2.txt')
    assert_equal 40, nightwriter.cut[0].length
    assert_equal 34, nightwriter.cut[1].length
    assert_equal nil, nightwriter.cut[2]

    nightwriter = NightWriter.new('fixtures/84eng.txt', 'message2.txt')
    assert_equal 40, nightwriter.cut[0].length
    assert_equal 40, nightwriter.cut[1].length
    assert_equal 4, nightwriter.cut[2].length
  end

  def test_it_can_translate
    nightwriter = NightWriter.new('fixtures/message.txt', 'message2.txt')

    nightwriter.cut
    nightwriter.translate
    assert_equal ["0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"],
    nightwriter.output
  end

  def test_it_can_write_translated_braille_to_new_file
    nightwriter = NightWriter.new('fixtures/message.txt', 'translated1.txt')
    nightwriter.cut
    nightwriter.translate
    nightwriter.write('translated1.txt')
    assert_equal "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n",
     File.read('translated1.txt')
  end

  def test_it_can_confirm
    nightwriter = NightWriter.new('fixtures/message.txt', 'translated1.txt')

    assert_equal 11, nightwriter.confirm
  end

  def test_it_can_write_translated_braille_to_new_file
    nightwriter = NightWriter.new('fixtures/lyrics.txt', 'writerout.txt')

    nightwriter.cut
    nightwriter.translate
    nightwriter.write

    assert_equal 173, nightwriter.confirm

    nightwriter.delete_output
  end

end
