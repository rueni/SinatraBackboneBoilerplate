require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'instafake'
)



get '/' do
  erb :index
end


get '/underscore_escape' do
  erb :v_one
end

get '/render_template' do
  erb :v_two
end

get '/iteration' do
  erb :v_three
end

get '/each_method' do
  erb :v_four
end

get '/backbone_views' do
  erb :v_five
end

get '/using_views' do
  erb :v_six
end

get '/models_intro' do
  erb :m_one
end

get '/model_build' do
  erb :m_two
end

get '/model_view' do
  erb :m_three
end

get '/model_collections' do
  erb :m_four
end

################### RESTFUL API ###################
#### /api/instafake

# Get all
get '/api/instafake' do
  InstagramModel.all.to_json
end

# Get one by id
get '/api/instafake/:id' do
  InstagramModel.find(params[:id]).to_json
end

# Create
post '/api/instafake' do
  request_body = JSON.parse(request.body.read.to_s)
  InstagramModel.create(request_body).to_json
end

# Update
put 'api/instafake/:id' do
  request_body = JSON.parse(request.body.read.to_s)
  @insta = InstagramModel.find(params[:id])
  @insta.username = request_body[:username]
  @insta.post = request_body[:post]
  @insta.description = request_body[:description]
  @insta.hashtags = request_body[:hashtags]
  @insta.save
  @insta.to_json
end
patch 'api/instafake/' do
  request_body = JSON.parse(request.body.read.to_s)
  @insta = InstagramModel.find(params[:id])
  @insta.username = request_body[:username]
  @insta.post = request_body[:post]
  @insta.description = request_body[:description]
  @insta.hashtags = request_body[:hashtags]
  @insta.save
  @insta.to_json
end

# Delete
delete 'api/instafake/:id' do
  request_body = JSON.parse(request.body.read.to_s)
  InstagramModel.destroy(request_body[:id]).to_json
end
