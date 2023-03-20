require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative 'create_person'
require_relative 'person_rentals'

# class ArcadeMain
class ArcadeMain
  include PersonRentals
  attr_accessor :books, :people

  def initialize
    @person = CreatePerson.new
    @books = []
    @people = @person.people
  end

  def list_books(with_index)
    @books.each_with_index do |book, i|
      indexing = with_index ? "#{i + 1}) " : ''
      puts "#{indexing}title: #{book.title}, author: #{book.author}"
    end
  end

  def add_book(title, author)
    @books << Book.new(title, author)
  end

  def add_person(type, age, name, third_param)
    @person.create_person(type, age, name, third_param)
  end

  def list_people(with_index)
    @people.each_with_index do |person, i|
      indexing = with_index ? "#{i + 1})" : ''
      id = with_index ? '' : " id: #{person[:data].id},"
      puts "#{indexing}[#{person[:type]}]#{id} age: #{person[:data].age}, name: #{person[:data].name}"
    end
  end

  def generate_rental(book_index, person_index, date)
    @books[book_index].add_rental(@people[person_index][:data], date)
  end

  def list_person_rentals(id)
    person_rentals(id, @people)
  end
end
