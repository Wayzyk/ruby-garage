module Storage
  Author = Struct.new(:name, :biography)
  Reader = Struct.new(:name, :email, :city, :street, :house)
  Book = Struct.new(:title, :author)
  Order = Struct.new(:book, :reader, :date)

  def load
    @author1 = Author.new('William Shakespeare', 'William Biography')
    @author2 = Author.new('Charles Dickens', 'Charles Biography')
    @author3 = Author.new('Markus Zusak', 'Markus biography')
    @author4 = Author.new('Victoria Aveyard', 'Victoria biography')
    @author5 = Author.new('Sarah J Maas', 'Sarah biography')

    @reader1 = Reader.new('John', 'john@email.com', 'NY', 'Jackson street', '24')
    @reader2 = Reader.new('Joe', 'joe@gmail.com', 'LA', 'Ocean street', '12')
    @reader3 = Reader.new('Kate', 'kate@gmail.com', 'DC', 'Plaza street', '19')
    @reader4 = Reader.new('Mike', 'mike@gmail.com', 'Tokyo', 'Shibua street', '9')
    @reader5 = Reader.new('Helen', 'helen@gmail.com', 'Ohio', 'Rose street', '1')

    @date = Time.at(rand * Time.now.to_i).to_s

    @book1 = Book.new('King Lear', @author1)
    @book2 = Book.new('Great Expectations',  @author2)
    @book3 = Book.new('Bridge of Clay',  @author3)
    @book4 = Book.new('Red Queen',  @author4)
    @book5 = Book.new('Throne of Glass',  @author5)

    @order1 = Order.new('King Lear', @reader1, @date)
    @order2 = Order.new('Great Expectations', @reader2, @date)
    @order3 = Order.new('Bridge of Clay', @reader3, @date)
    @order4 = Order.new('Throne of Glass', @reader4, @date)
    @order5 = Order.new('Red Queen', @reader5, @date)
  end
end
