require_relative './file'
require_relative './input'
require_relative './output'

class InputOutput

  def initialize(name)
    CreateFile.new(name)
    @input = Input.new(name)
    @output = Output.new(name)
  end

  def write(content)
    @input.write(content)
  end

  def read
    @output.read
  end
end

i = InputOutput.new("simon.txt")
puts i.read