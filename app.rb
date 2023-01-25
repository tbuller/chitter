require 'sinatra'
require 'sinatra/reloader'
require 'bcrypt'
require_relative './lib/database_connection'
require_relative './lib/post_repo'
require_relative './lib/user_repo'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end  

  get '/home' do
    post_repo = PostRepo.new
    posts = post_repo.all
    @posts = posts
    return erb(:home)
  end  

  get '/login' do
    return erb(:login)
  end
  
  get '/signup' do
    return erb(:signup)
  end  

  post '/users' do
    repo = UserRepo.new
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    repo.create(@user)
    return erb(:users)
  end  

  get '/post' do
    return erb(:post)
  end  

  post '/posts' do
    repo = PostRepo.new
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    @post.time = params[:time]
    @post.user_id = params[:user_id]
    repo.create(@post)
  end  


end    