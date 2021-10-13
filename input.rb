require 'json'
class Input
  def initialize(file_name)
    @file_name = file_name
  end
  def write(content)
    File.write(@file_name, JSON.generate("#{content}\n"), mode: 'a')
  end
end