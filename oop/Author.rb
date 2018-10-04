class Author
  attr_reader :name, :biography

  def initialize(name, biography)
    @name = name
    @biography = biography
  end

  def author_name
    "#{name}"
  end

end
