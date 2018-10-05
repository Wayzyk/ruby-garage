class Order
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date)
    @book = book
    @reader = reader
    @date = Time.at(rand * Time.now.to_i).to_s
  end
end
