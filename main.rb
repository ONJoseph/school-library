require_relative './app'

def welcome
  puts 'Welcome to the School Library App!'
end

def error(func, library)
  puts "Error! Please enter a valid number.\nPress ENTER to continue."
  gets.chomp
  method(func).call(library)
end

def list_books(library)
  library.list_books(false)
  choices(library)
end

def list_people(library)
  library.list_people(false)
  choices(library)
end

def create_person(library)
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  choice = gets.chomp.to_i

  choice > 2 && error(:create_person, library)

  print 'Age: '
  age = gets.chomp.to_i

  print 'Name: '
  name = gets.chomp

  if choice == 1
    print 'Has parent Permission? (y/n): '
    pm = gets.chomp

    library.add_person(1, age, name, pm == 'y')

  else
    print 'Specialization: '
    spec = gets.chomp

    library.add_person(2, age, name, spec)
  end

  puts 'Person created Successfully!'
  choices(library)
end

def create_book(library)
  print 'Title: '
  title = gets.chomp

  print 'Author: '
  author = gets.chomp

  library.add_book(title, author)

  puts 'Book created Successfully!'
  choices(library)
end

def create_rental(library)
  puts 'Select a book from the following list by number:'
  library.list_books(true)
  book_id = gets.chomp.to_i
  (book_id < 1 || book_id > library.books.length) && error(:create_rental, library)

  puts ' Select a person from the following list by number'
  library.list_people(true)
  person_id = gets.chomp.to_i
  (person_id < 1 || person_id > library.people.length) && error(:create_rental, library)

  print 'Date: '
  date = gets.chomp

  library.create_rental(book_id - 1, person_id - 1, date)

  puts 'Rental created Successfully!'
  choices(library)
end

def list_rentals(library)
  library.list_people(false)
  print 'ID of Person: '
  id = gets.chomp.to_i

  library.list_person_rentals(id)
  choices(library)
end

def list_options
  entry = "\nPlease choose an option by entering a number:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit"

  puts entry
end

def choices(library)
  list_options
  input = gets.chomp.to_i

  case input
  when 1
    list_books(library)
  when 2
    list_people(library)
  when 3
    create_person(library)
  when 4
    create_book(library)
  when 5
    create_rental(library)
  when 6
    list_rentals(library)
  end
  # Have a way to quit the app.
  puts 'Thank you for using this app!'
end

def main
  library = App.new
  choices(library)
end

welcome
main
