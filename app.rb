require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './lib/bookmark'

class Bookmarks < Sinatra::Base
  enable :sessions, :method_override

  get '/bookmarks' do 
    @bookmarks = Bookmark.all

    erb :'bookmarks/index'
  end 

  get '/newbookmark_page' do 
    erb :'bookmarks/newbookmark'
  end 
  
  get '/bookmarks/:id/edit' do 
    @bookmark_id = params[:id]
    erb :'bookmarks/edit'
  end 

  post '/add_bookmark' do 
    bookmark = params[:bookmark] 
    title = params[:title]
    Bookmark.add_bookmark(url: bookmark, title: title)
    redirect '/bookmarks'
  end 

  delete '/bookmarks/:id' do 
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end 

  patch '/bookmarks/:id' do 
    Bookmark.ammend(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end 

  run! if app_file == $0
  
end