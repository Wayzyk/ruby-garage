require './Author.rb'
require './Book.rb'
require './Order.rb'
require './Reader.rb'
require './Info.rb'
require 'yaml'

class Library
  include Info
  attr_accessor :books, :orders, :readers, :authors

  def initialize
    @books = []
    @orders = []
    @readers = []
    @authors = []
  end

  def filling_arrays
    @books << Book.new('King Lear', 'William Shakespeare')
    @books << Book.new('Great Expectations', 'Charles Dickens')
    @books << Book.new('Bridge of Clay', 'Markus Zusak')
    @books << Book.new('Red Queen', 'Victoria Aveyard')
    @books << Book.new('Throne of Glass', 'Sarah J Maas')
    @orders << Order.new('King Lear', 'Reader 1', '25-09-2018')
    @orders << Order.new('Great Expectations', 'Reader 2', '30-09-2018')
    @orders << Order.new('Bridge of Clay', 'Reader 3', '12-08-2008')
    @orders << Order.new('Throne of Glass', 'Reader 4', '23-09-2017')
    @orders << Order.new('Red Queen', 'Reader 5', '22-01-2012')
    @readers << Reader.new('John', 'john@email.com', 'NY', 'Jackson street', '24')
    @readers << Reader.new('Joe', 'joe@gmail.com', 'LA', 'Ocean street', '12')
    @readers << Reader.new('Kate', 'kate@gmail.com', 'DC', 'Plaza street', '19')
    @readers << Reader.new('Mike', 'mike@gmail.com', 'Tokyo', 'Shibua street', '9')
    @readers << Reader.new('Helen', 'helen@gmail.com', 'Ohio', 'Rose street', '1')
    @authors << Author.new('William Shakespeare', 'William Biography')
    @authors << Author.new('Charles Dickens', 'Charles Biography')
    @authors << Author.new('Markus Zusak', 'Markus biography')
    @authors << Author.new('Victoria Aveyard', 'Victoria biography')
    @authors << Author.new('Sarah J Maas', 'Sarah biography')
  end

  def save_info_to_file
    all_data = []
    all_data.push(@books, @order, @readers, @authors)
    File.open("all_data.yml", "w") { |file| file.write(all_data.to_yaml) }
  end

end

library = Library.new
library.filling_arrays
library.save_info_to_file
puts "Often takes the book: \r\n #{library.active_reader}"
puts "The most popular book: \r\n #{library.popular_book}"
puts "How many people ordered one of the three most popular books: \r\n #{library.top_3_book_users}"
