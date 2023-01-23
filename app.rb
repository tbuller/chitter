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

end    