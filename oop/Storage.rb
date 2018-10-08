require './Author.rb'
require './Book.rb'
require './Order.rb'
require './Reader.rb'
require 'yaml'
module Storage

  def download_from_file
    @all_data = YAML.load(File.read('all_data.yml'))
  end


  def download_by_categories
    @hard_data = YAML.load(File.read('all_data.yml'))
    @books = @hard_data[:book]
    @orders = @hard_data[:order]
    @authors = @hard_data[:author]
    @readers = @hard_data[:reader]
  end

end
