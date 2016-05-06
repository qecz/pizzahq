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

