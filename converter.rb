require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
class Converter 

  def self.hash_to_people_arr(arr)
    instance_arr = arr.map do |item|
      case item["type"]
      when 'Teacher' 
      Teacher.new(
        age: item["age"],
        specialization: item["specialization"],
        name: item["name"],
        id: item["id"]
      )
      when 'Student'
      Student.new(
        age: item["age"],
        name: item["name"],
        parent_permission: item["parent_permission"],
        id: item["id"]
      )
      end
    end
    instance_arr.empty? ? [] : instance_arr
  end

  def self.hash_to_books_arr(arr)
    instance_arr = arr.map do |item|
      Book.new(item["title"],item["author"])
    end
  end

  
end
