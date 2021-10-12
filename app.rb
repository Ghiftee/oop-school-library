require_relative 'classroom'
require_relative 'listings'
require_relative 'create'
class App
  attr_accessor :people, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
    @listings = Listings.new(@books, @people, @rentals)
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
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]'
    answer = gets.chomp

    case answer
    when '1'
      @people << Create.student
    when '2'
      @people << Create.teacher
    else
      puts 'Please choose a valid number'
    end
  end

  def list_books
    @listings.books
  end

  def list_people 
    @listings.people
  end

  def create_book
    @books << Create.book
  end

  def create_rental
    @rentals << Create.rental(@books, @people)
  end

  def list_rentals
    @listings.rentals
  end
end
