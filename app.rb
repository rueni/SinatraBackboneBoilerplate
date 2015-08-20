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
  InstagramModel.create(params).to_json
end

# Update
put 'api/instafake/:id' do
  @insta = InstagramModel.find(params[:id])
  @insta.username = params[:username]
  @insta.post = params[:post]
  @insta.description = params[:description]
  @insta.hastags = params[:hashtags]
  @insta.save
  @insta.to_json
end
patch 'api/instafake/' do
  @insta = InstagramModel.find(params[:id])
  @insta.username = params[:username]
  @insta.post = params[:post]
  @insta.description = params[:description]
  @insta.hastags = params[:hashtags]
  @insta.save
  @insta.to_json
end

# Delete
delete 'api/instafake/:id' do
  InstagramModel.destroy(params[:id]).to_json
end
