require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

class Listings
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  def books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, age: #{person.age}" }
  end

  def rentals
    print 'ID of person: '
    id = gets.chomp

    puts 'Rentals: '

    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id.to_i
    end
  end
end