require './test/test_helper.rb'
require './lib/translator.rb'



class TranslatorTest < MiniTest::Test

  def test_it_exists
    translator = Translator.new

    assert_instance_of Translator, translator
  end

  def test_it_has_alphabets
    translator = Translator.new

    assert_equal ["0.", "..", ".."], translator.lowercase["a"]
    assert_equal ["00", "..", "0."],translator.lowercase["m"]
    assert_equal [".0", "0.", "0."],translator.lowercase["s"]
    assert_equal [".0", "00", ".0"],translator.lowercase["w"]
    assert_equal ["..", "..", ".."],translator.lowercase[" "]

    assert_equal "a", translator.rev_lowercase[["0.", "..", ".."]]
    assert_equal "j", translator.rev_lowercase[[".0", "00", ".."]]
    assert_equal "r", translator.rev_lowercase[["0.", "00", "0."]]
    assert_equal "x", translator.rev_lowercase[["00", "..", "00"]]
    assert_equal " ", translator.rev_lowercase[["..", "..", ".."]]
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

    arrays = [[["0.", "..", ".."]]]
    arrays2 = [[["0.", "..", ".."],["0.", "0.", ".."],["00", "..", ".."]]]

    assert_equal "a", translator.translate_from_braille_arrays(arrays)
    assert_equal "abc", translator.translate_from_braille_arrays(arrays2)
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

  def test_it_can_group_lines
    translator = Translator.new

    text3 = "0.0.\n..00\n00..\n.0.0\n00..\n..00\n"
    translator.split_braille_lines(text3)
    assert_equal [["0.0.", "..00", "00.."], [".0.0", "00..", "..00"]],

    translator.group_braille_by_lines
    text4 = "0.0.\n..00\n00..\n.0.0\n00..\n..00\n0.0.\n..00\n00..\n"
    translator.split_braille_lines(text4)
    assert_equal [["0.0.", "..00", "00.."], [".0.0", "00..", "..00"], ["0.0.", "..00", "00.."]],
    translator.group_braille_by_lines

    text5 = "abcdef\nghiklm\nnopqrs\ntuvwxy\nz12345\n6789AB\n"
    translator.split_braille_lines(text5)
    assert_equal [["abcdef", "ghiklm", "nopqrs"], ["tuvwxy", "z12345", "6789AB"]],
     translator.group_braille_by_lines
  end

  def test_it_can_break_up_strings_by_two
   translator = Translator.new

   text4 = "abcdefgh\niklmnopq\nrstuvwxy\nz1234567\n89ABCDEF\nGHIJKLMN\n"

   translator.split_braille_lines(text4)
   translator.group_braille_by_lines
   assert_equal [[["ab", "cd", "ef", "gh"],
    ["ik", "lm", "no", "pq"],
     ["rs", "tu", "vw", "xy"]],
      [["z1", "23", "45", "67"],
       ["89", "AB", "CD", "EF"],
       ["GH", "IJ", "KL", "MN"]]], translator.split_braille_chars
  end

  def test_it_can_combine_strings_by_position
    translator = Translator.new

    text4 = "abcdefgh\niklmnopq\nrstuvwxy\nz1234567\n89ABCDEF\nGHIJKLMN\n"

    translator.split_braille_lines(text4)
    translator.group_braille_by_lines
    translator.split_braille_chars

    assert_equal [[["ab", "ik", "rs"],
     ["cd", "lm", "tu"],
      ["ef", "no", "vw"],
       ["gh", "pq", "xy"]],
        [["z1", "89", "GH"],
         ["23", "AB", "IJ"],
          ["45", "CD", "KL"],
           ["67", "EF", "MN"]]], translator.combine_braille_chars
    end

end
