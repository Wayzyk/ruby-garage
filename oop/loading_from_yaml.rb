require './Author.rb'
require './Book.rb'
require './Order.rb'
require './Reader.rb'
require 'yaml'

all_data = YAML.load(File.read("all_data.yml"))

p all_data
