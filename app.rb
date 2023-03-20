require_relative './arcade_main'
require_relative './main_helper'

# Class App
class App < ArcadeMain
  include MainHelper

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i

    choice > 2 && error(:create_person)

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    if choice == 1
      print 'Has parent Permission? (y/n): '
      pm = gets.chomp

      add_person(1, age, name, pm == 'y')

    else
      print 'Specialization: '
      spec = gets.chomp

      add_person(2, age, name, spec)
    end

    puts 'Person created Successfully!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    add_book(title, author)

    puts 'Book created Successfully!'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    list_books(true)
    book_id = gets.chomp.to_i
    (book_id < 1 || book_id > books.length) && error(:create_rental)

    puts ' Select a person from the following list by number'
    list_people(true)
    person_id = gets.chomp.to_i
    (person_id < 1 || person_id > people.length) && error(:create_rental)

    print 'Date: '
    date = gets.chomp

    generate_rental(book_id - 1, person_id - 1, date)

    puts 'Rental created Successfully!'
  end

  def list_rentals
    list_people(false)
    print 'ID of Person: '
    id = gets.chomp.to_i

    list_person_rentals(id)
  end

  def run_choices(input)
    case input
    when 1
      list_books(false)
    when 2
      list_people(false)
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def choices
    list_options
    input = gets.chomp.to_i

    if input > 6
      puts 'Thank you for using this App!'
      exit
    else
      run_choices(input)
    end
  end
end
