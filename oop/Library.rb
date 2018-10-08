require './Info.rb'
require './Storage.rb'
require 'yaml'

class Library
  attr_accessor :books, :orders, :readers, :authors
  include Storage
  include Info

  def initialize
    @books = []
    @orders = []
    @readers = []
    @authors = []
  end

  def filling_arrays
    @readers = [
      Reader.new('John', 'john@email.com', 'NY', 'Jackson street', '24'),
      Reader.new('Joe', 'joe@gmail.com', 'LA', 'Ocean street', '12'),
      Reader.new('Kate', 'kate@gmail.com', 'DC', 'Plaza street', '19'),
      Reader.new('Mike', 'mike@gmail.com', 'Tokyo', 'Shibua street', '9'),
      Reader.new('Helen', 'helen@gmail.com', 'Ohio', 'Rose street', '1')
    ]

    @authors = [
      Author.new('William Shakespeare', 'William Biography'),
      Author.new('Charles Dickens', 'Charles Biography'),
      Author.new('Markus Zusak', 'Markus biography'),
      Author.new('Victoria Aveyard', 'Victoria biography'),
      Author.new('Sarah J Maas', 'Sarah biography')
    ]

    @books = [
      Book.new('King Lear', @authors[0].name),
      Book.new('Great Expectations', @authors[1].name),
      Book.new('Bridge of Clay', @authors[2].name),
      Book.new('Red Queen', @authors[3].name),
      Book.new('Throne of Glass', @authors[4].name)
    ]

    @orders = [
      Order.new(@books[0].title, @readers[0].name, @date),
      Order.new(@books[1].title, @readers[1].name, @date),
      Order.new(@books[2].title, @readers[2].name, @date),
      Order.new(@books[3].title, @readers[3].name, @date),
      Order.new(@books[4].title, @readers[4].name, @date)
    ]
  end

  def save_info_to_file
    @all_data = { books: @books, orders: @orders, readers: @readers, authors: @authors }
    File.open('all_data.yml', 'w') { |file| file.write(@all_data.to_yaml) }
  end
end

library = Library.new
# load all data to arrays
library.filling_arrays
# write all data to file
library.save_info_to_file
# download all data from file
library.download_from_file
# download all data from file by categories
library.download_by_categories
puts "The most active reader #{library.active_reader}"
puts "The most popular book: \r\n #{library.popular_book}"
puts "How many people ordered one of the three most popular books: \r\n #{library.top_3_book_users}"
