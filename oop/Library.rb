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
      @reader1 = Reader.new('John', 'john@email.com', 'NY', 'Jackson street', '24'),
      @reader2 = Reader.new('Joe', 'joe@gmail.com', 'LA', 'Ocean street', '12'),
      @reader3 = Reader.new('Kate', 'kate@gmail.com', 'DC', 'Plaza street', '19'),
      @reader4 = Reader.new('Mike', 'mike@gmail.com', 'Tokyo', 'Shibua street', '9'),
      @reader5 = Reader.new('Helen', 'helen@gmail.com', 'Ohio', 'Rose street', '1')
    ]

    @authors = [
      @author1 = Author.new('William Shakespeare', 'William Biography'),
      @author2 = Author.new('Charles Dickens', 'Charles Biography'),
      @author3 = Author.new('Markus Zusak', 'Markus biography'),
      @author4 = Author.new('Victoria Aveyard', 'Victoria biography'),
      @author5 = Author.new('Sarah J Maas', 'Sarah biography')
    ]

    @books = [
      @book1 = Book.new('King Lear', @author1.author_name),
      @book2 = Book.new('Great Expectations',  @author2.author_name),
      @book3 = Book.new('Bridge of Clay',  @author3.author_name),
      @book4 = Book.new('Red Queen',  @author4.author_name),
      @book5 = Book.new('Throne of Glass',  @author5.author_name)
    ]

    @orders = [
      @order1 = Order.new(@book1.book_title, @reader1.reader_name, @date),
      @order2 = Order.new(@book2.book_title, @reader2.reader_name, @date),
      @order3 = Order.new(@book3.book_title, @reader3.reader_name, @date),
      @order4 = Order.new(@book4.book_title, @reader4.reader_name, @date),
      @order5 = Order.new(@book5.book_title, @reader5.reader_name, @date)
    ]

  end

  def save_info_to_file
    @all_data = { books: @books, orders: @orders, readers: @readers, authors: @authors }
    File.open("all_data.yml", "w") { |file| file.write(@all_data.to_yaml) }
  end

end

library = Library.new
#load all data to arrays
library.filling_arrays
#write all data to file
library.save_info_to_file
#download all data from file
library.download_from_file
#download all data from file by categories
library.download_by_categories
puts "The most active reader #{library.active_reader}"
puts "The most popular book: \r\n #{library.popular_book}"
puts "How many people ordered one of the three most popular books: \r\n #{library.top_3_book_users}"
