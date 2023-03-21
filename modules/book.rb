require 'json'
require_relative './book'

module PreserveBook
  FILE_NAME = './database/book.json'.freeze

  def create_book_class(arr)
    new_arr = []
    arr.each do |el|
      new_arr << Book.new(el['title'], el['author'])
    end

    new_arr
  end

  private :create_book_class

  # we need to open the file
  def fetch_books
    File.new(FILE_NAME.to_s, 'w') unless File.exist?(FILE_NAME)
    file = File.read(FILE_NAME)
    data = file.empty? ? [] : JSON.parse(file)
    create_book_class(data)
  end

  # we can write to the file
  def preserve_books(data)
    new_data = []
    data.each do |d|
      new_data << {
        title: d.title,
        author: d.author
      }
    end
    File.write(FILE_NAME, JSON.generate(new_data))
  end
end
