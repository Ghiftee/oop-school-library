require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def to_hash
    {
      :type => 'Student',
      :name => @name,
      :age => @age,
      :parent_permission => @parent_permission,
      :id => @id
    }
  end

end
