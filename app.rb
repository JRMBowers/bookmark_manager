require 'sinatra'
require 'sinatra/reloader' if development?

class Bookmark < Sinatra::Base
  get '/' do 
   erb :index
  end 

  run! if app_file == $0
end