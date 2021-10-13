require 'fileutils'

class CreateFile

  def initialize(file_name)
    unless already_created? file_name
      FileUtils.touch(file_name)
    end
  end

  def already_created?(file)
    File.exists?(file)
  end
end
