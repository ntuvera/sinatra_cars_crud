require 'bundler'
Bundler.require

require_relative 'models/car'
require_relative './config'

#redirect from root
get '/' do
  redirect '/cars/'
end

#index
get '/cars' do
  @cars = Car.all
  erb :index
end

#new
get '/cars/new' do
  erb :new
end

#show
get '/cars/:id' do
  @car = Car.find(params[:id])
  erb :show
end

#create
post '/cars' do
  car = Car.create(make: params['make'], model: params['model'], year: params['year'])
  car.save
  redirect "/cars/#{ car.id }"
end

#edit
get '/cars/:id' do
  @car = Car.find(params[:id])
  erb :edit
end

put '/cards:/id' do
  car = Car.find(params[:id])
  car.make = params[:make]
  car.model= params[:model]
  car.year = params[:year]
  redirect '/cars/#{ car.id }'
end

#destroy
delete '/cars/:id' do
  Car.delete(params[:id])
  redirect "/cars"
end
