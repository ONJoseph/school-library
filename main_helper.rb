module MainHelper
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

  def error(func)
    puts "Error! Please enter a valid number.\nPress ENTER to continue."
    gets.chomp
    method(func).call
  end
end
