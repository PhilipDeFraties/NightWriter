require 'minitest/autorun'
require 'minitest/pride'
require './lib/alphabet'

class AlphabetTest < MiniTest::Test

  def test_it_exists
    alphabet = Alphabet.new

    assert_instance_of Alphabet, alphabet
  end

  def test_it_has_lowercase_hash
    alphabet = Alphabet.new

    assert_equal Hash, alphabet.lowercase.class
    assert_equal ["0.", "..", ".."], alphabet.lowercase["a"]
    assert_equal ["00", "..", "0."], alphabet.lowercase["m"]
    assert_equal [".0", "0.", "0."], alphabet.lowercase["s"]
  end
end
