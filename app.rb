require 'sinatra'
require 'sinatra/reloader'
require 'bcrypt'
require_relative './lib/database_connection'
require_relative './lib/post_repo'
require_relative './lib/user_repo'

DatabaseConnection.connect

class Application < Sinatra::Base
  
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end
  
end    