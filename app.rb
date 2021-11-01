require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './lib/bookmark'

class Bookmarks < Sinatra::Base
  
  get '/bookmarks' do 
    @bookmarks = Bookmark.all

    erb :'bookmarks/index'
  end 

  run! if app_file == $0
  
end