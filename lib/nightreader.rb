require 'pry'
require './lib/translator.rb'
require './lib/filereader.rb'

class NightReader
  attr_reader :translator,
              :text
  include FileReader
def initialize
  @translator = Translator.new
end

end
