require './test/test_helper.rb'
require './lib/nightreader.rb'

class NightReaderTest < MiniTest::Test

  def test_it_has_input_braille
    nightreader = NightReader.new('single_braille.txt',  'readerout.txt')

    assert_equal "0.\n..\n..", nightreader.braille_text
  end

  def test_it_has_input_output_files
    nightreader = NightReader.new('single_braille.txt',  'readerout.txt')

    assert_equal "single_braille.txt", nightreader.file_input
    assert_equal 'readerout.txt', nightreader.file_output
  end

  def test_it_has_access_to_translator_and_alphabet
    nightreader = NightReader.new("single_braille.txt",  'readerout.txt')

    assert_instance_of Translator, nightreader.translator

  end

  def test_it_has_no_output_by_default
    nightreader = NightReader.new("single_braille.txt", 'readerout.txt')

    assert_equal [], nightreader.output
  end

  def test_it_can_confirm
    nightreader = NightReader.new("braille1.txt",  'readerout.txt')

    assert_equal 66, nightreader.confirm
  end

  def test_it_can_translate
    nightreader = NightReader.new("encoded.txt",  'readerout.txt')

    assert_equal ["close your eyes and see when there aint no light all youll ever be come and save the night cause i dont leave when the morning comes it doesnt seem to say an awful lot to me"],
     nightreader.translate

    nightreader = NightReader.new("single_braille.txt", 'readerout.txt')

    assert_equal ["a"], nightreader.translate
  end

  def test_it_can_translate_and_write_to_output_file
    nightreader = NightReader.new("encoded.txt",  'readerout.txt')

    nightreader.translate
    nightreader.write

    assert_equal "close your eyes and see when there aint no light all youll ever be come and save the night cause i dont leave when the morning comes it doesnt seem to say an awful lot to me",
     File.read('readerout.txt')

     nightreader.delete_output
  end
end
