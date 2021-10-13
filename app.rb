require_relative 'classroom'
require_relative 'listings'
require_relative 'create'
require_relative 'input_output'
class App
  attr_accessor :people, :books

  def initialize
    @peopleIO = InputOutput.new("people.json")
    @booksIO = InputOutput.new("books.json")
    @rentalsIO = InputOutput.new("rentals.json")

    @people = []
    @books = []
    @rental = []
    @listings = Listings.new(@books, @people, @rental)
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
    new_person = nil
    case answer
    when '1'
      new_person = Create.student
      @people << new_person
      @peopleIO.write(new_person.to_hash)
    when '2'
      new_person = Create.teacher
      @people << new_person
      @peopleIO.write(new_person.to_hash)
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
    new_book = Create.book
    @books << new_book
    @booksIO.write(new_book.to_hash)
  end

  def create_rental
    @rental << Create.rental(@books, @people)
  end

  def list_rentals
    @listings.rental
  end
end
