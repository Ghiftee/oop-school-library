require 'json'

class Output 
  def initialize(file_name)
    @file_name = file_name
  end

  def valid_json?
    JSON.parse(File.read(@file_name))
      true
    rescue JSON::ParserError => e
      false
  end

  def read
    if valid_json?
      JSON.parse(File.read(@file_name))
    end
  end
end
