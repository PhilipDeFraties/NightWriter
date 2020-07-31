class Translator

  def initialize(eng_text_file_path)
    @eng_text = eng_text_file_path
  end

  def read_from_english_file
    p File.read(@eng_text) 
  end

end
