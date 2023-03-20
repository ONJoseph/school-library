require_relative './app'

def main
  puts 'Welcome to the School Library App!'

  library = App.new

  loop do
    library.choices
  end
end

main
