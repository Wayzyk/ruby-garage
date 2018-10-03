class Author
  attr_reader :name, :biography

  def initialize(name, biography)
    @name = name
    @biography = biography
  end

  def full_author_info
    "Author name: #{@name}, Biography: #{@biography}"
  end

end
