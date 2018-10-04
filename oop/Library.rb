require './Info.rb'
require './Storage.rb'
require 'yaml'

class Library
  attr_accessor :books, :orders, :readers, :authors
  include Storage

  def initialize
    @books = []
    @orders = []
    @readers = []
    @authors = []
  end

  def filling_arrays
    @books << @author1
    @books << @author2
    @books << @author3
    @books << @author4
    @books << @author5
    @readers << @reader1
    @readers << @reader2
    @readers << @reader3
    @readers << @reader4
    @readers << @reader5
    @orders << @order1
    @orders << @order2
    @orders << @order3
    @orders << @order4
    @orders << @order5
    @authors << @author1
    @authors << @author2
    @authors << @author3
    @authors << @author4
    @authors << @author5
  end

  def save_info_to_file
    all_data = []
    all_data.push(@books, @order, @readers, @authors)
    File.open("all_data.yml", "w") { |file| file.write(all_data.to_yaml) }
  end

end

library = Library.new
library.load
library.filling_arrays
library.save_info_to_file

# puts "Often takes the book: \r\n #{library.active_reader}"
# puts "The most popular book: \r\n #{library.popular_book}"
# puts "How many people ordered one of the three most popular books: \r\n #{library.top_3_book_users}"
