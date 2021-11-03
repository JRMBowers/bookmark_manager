require 'pg'
require 'spec_helper'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks;")
end 

def add_bookmarks 
  visit('/bookmarks')
  click_on('Add New Bookmark')
  fill_in('bookmark', with: 'http://www.makersacademy.com' )
  fill_in('title', with: 'MakersAcademy' )
  click_on('Submit Bookmark')
end 