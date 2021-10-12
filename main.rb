require_relative 'classroom'
require_relative 'listings'
class App
  attr_accessor :people, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
    @listings = Listings.new(@books,@people,@rentals)
  end

  def run
    puts 'Welcome to School Library App!'
    choices
  end

  def choices
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    user_choice = gets.chomp
    start_options user_choice
  end

  def start_options(options)
    case options
    when '1'
      @listings.book
    when '2'
      @listings.people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      @listings.rentals
    else
      puts 'Exit'
    end
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]'
    answer = gets.chomp

    case answer
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please choose a valid number'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'

    student = Student.new(name: name, age: age, parent_permission: permission, classroom: @classroom)

    @people << student

    puts 'Person created successfully'
    choices
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(name: name, age: age, specialization: specialization)

    @people << teacher

    puts 'Person created successfully'
    choices
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)

    @books << book

    puts 'Book created successfully'

    choices
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, idx| puts "#{idx}) Title: #{book.title}, Author: #{book.author}" }

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number(not id)'
    @people.each_with_index { |person, idx| puts "#{idx}) ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }

    person_index = gets.chomp.to_i

    puts
    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])

    @rentals << rental

    puts 'Rental created successfully'

    choices
  end
end

def main
  app = App.new
  app.run
end

main
