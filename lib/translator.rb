class Translator
  attr_reader :input_text
  def initialize
    @input_text = ""
  end

  def read(filepath)
    @input_text << File.read(filepath)
  end


end
