class Output 
  def initialize(file_name)
    @file_name = file_name
  end

  def read
    f = File.open(@file_name)
    f_data = f.readlines.map(&:chomp)
    f.close
    f_data
  end
end