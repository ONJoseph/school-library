require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rentals'
require_relative 'classroom'

class App
  attr_accessor :books, :people, :rentals, :classroom

  def initialize
    @books = []
    @people = []
    @rentals = []
    @classroom = Classroom.new('Math')
  end

  def list_of_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_of_people
    @people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.age}"
    end
  end

  def input_letters(text, range)
    loop do
      print text
      input = gets.chomp.upcase
      return input if range.include?(input)
    end
  end

  def create_student()
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    permission_input = input_letters('Has parent permission? [Y/N]: ', %w[Y N])
    case permission_input
    when 'Y'
      permission = true
    when 'N'
      permission = false
    end

    people.push(Student.new(age, classroom, name, parent_permission: permission))
    puts 'Person created successfully!'
  end

  def create_teacher()
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'specialization: '
    specialization = gets.chomp

    people.push(Teacher.new(age, specialization, name))
    puts 'Person created successfully!'
  end

  def input(text, range)
    loop do
      print text
      input = gets.chomp.to_i
      return input if range.include?(input)
    end
  end

  def create_person
    student_or_teacher = input('Do you want to create student (1) or teacher (2)? [Input a number]: ', (1..2))
    case student_or_teacher
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_book()
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    books.push(Book.new(title, author))
    puts 'Book created successfully!'
  end

  def create_rental()
    puts 'Select a book from the following list by number: '
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title} Author: #{book.author}"
    end
    book_index = input('Write a valid number ', (0...books.length))

    puts 'Select a person from the following list by number (not id): '
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = input('Write a valid number ', (0...people.length))

    print 'Date: '
    date = gets.chomp
    rentals.push(Rental.new(date, people[person_index], books[book_index]))
    puts 'Rental created successfully!'
  end

  def display_rentals_by_person_id()
    print 'Person ID: '
    person_id = gets.chomp.to_i
    rentals.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.author}." if rent.person.id == person_id
    end
  end
end
