#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/ActiveRecord'


set :database, "sqlite3:pizashop.db"

class Product < ActiveRecord::Base
	
end


get '/' do
	@products = Product.all
	erb :index 
end

get '/about' do

	erb :about
	
end

post '/cart' do
	
	orders_input = params[:orders]
	@orders = parse_orders_line orders_input
	erb :cart 
end

def parse_orders_line orders_line
arr = []
s1 = orders_line.split(/,/)
s1.each do |s|
	s2 = s.split(/\=/)
	s3=s2[0].split(/_/)
	
	key=s3[1]
	value=s2[1]
	
	arr2=[key, value]
	arr.push arr2
end

return arr

end


