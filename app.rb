require 'bundler'
Bundler.require

get '/' do
  erb :index
end

get '/1' do
  erb :one
end

get '/2' do
  erb :two
end

get '/3' do
  erb :three
end

get '/4' do
  erb :four
end

get '/5' do
  erb :five
end

get '/6' do
  erb :six
end
