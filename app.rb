#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/ActiveRecord'


set :database, "sqlite3:pizashop.db"

class Product < ActiveRecord::Base
	
end

class Order < ActiveRecord::Base
	
end

get '/' do
	@products = Product.all
	erb :index 
end

get '/admin' do

	@orders_all = Order.all
	erb :admin
	
end

get '/about' do

	erb :about
	
end

post '/cart' do
	
	@orders_input = params[:orders]
	@orders = parse_orders_line @orders_input
	
	#сообщение о пустой корзине
	if @orders.length == 0
		return erb "Корзина пуста"
	end

	erb :cart 
end

post '/place_order' do
	@order = Order.create params[:order]
	erb :order_placed
	#erb "Thank you. Order placed #{@order.inspect}" 
end

def parse_orders_line orders_line
arr = []
s1 = orders_line.split(/,/)
s1.each do |s|
	s2 = s.split(/\=/)
	s3=s2[0].split(/_/)
	
	key=Product.find(s3[1])
	value=s2[1]
	
	arr2=[key, value]
	arr.push arr2
end

return arr

end


