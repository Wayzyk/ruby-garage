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
    @hard_data = File.open("all_data.yml") { |yf| YAML::load (yf) }
    @books = @hard_data[:books]
    @orders = @hard_data[:orders]
    @authors = @hard_data[:authors]
    @readers = @hard_data[:readers]
  end

end
