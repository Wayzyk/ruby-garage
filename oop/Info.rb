module Info

   def active_reader
     @orders.group_by(&:reader).sort_by { |reader, order| order.count }.reverse.dig(0,0)
   end

  def popular_book
    sorted_books.dig(0,0)
  end

  def sorted_books
    @orders.group_by(&:book).sort_by { |book, order| order.count }.reverse
  end

  def top_3_book_users
    sorted_books.first(3).collect {|book, order| order }.flatten.collect(&:reader).uniq.count
  end

end
