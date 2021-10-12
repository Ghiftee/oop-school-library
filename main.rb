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
    when '1' then @listings.books
    when '2' then @listings.people
    when '3' then create_person
    when '4' then @books << Create.book
    when '5' then @rentals << Create.rental(@books, @people)
    when '6' then @listings.rentals
    else
      puts 'Exit'
      return
    end
    choices
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
end

def main
  app = App.new
  app.run
end

main
