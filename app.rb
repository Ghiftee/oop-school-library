require_relative 'classroom'
require_relative 'listings'
require_relative 'create'
require_relative 'input_output'
class App
  attr_accessor :people, :books

  def initialize
    @peopleFile = InputOutput.new("people.json")
    @booksFile = InputOutput.new("books.json")
    @rentalsFile = InputOutput.new("rentals.json")
    @people = []
    @books = []
    @rental = []
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
    new_person = nil
    case answer
    when '1'
      new_person = Create.student
      @peopleFile.write(new_person.to_s)
      @people << new_person
    when '2'
      new_person = Create.teacher
      @peopleFile.write(new_person.to_s)
      @people << new_person
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
    @booksFile.write(new_book.to_s)
    @books << new_book
  end

  def create_rental
    @rentalsFile.write(Create.rental(@books, @people).to_s)
    @rentals << Create.rental(@books, @people)
  end

  def list_rentals
    @listings.rentals
  end
end
