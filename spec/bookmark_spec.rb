require 'bookmark.rb'
require 'database_helpers'
describe Bookmark do 
  
  describe '.all' do 

    it 'returns a list of bookmarks' do 

      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      bookmarktest = Bookmark.add_bookmark(url: 'http://www.makersacademy.com', title: 'Makers')
      Bookmark.add_bookmark(url: 'http://www.destroyallsoftware.com', title: 'DestroyAllSoftware')
      Bookmark.add_bookmark(url: 'http://www.google.com', title: 'Google')

      bookmarkstest = Bookmark.all
      
      expect(bookmarkstest.first.title).to include('Makers')
      expect(bookmarkstest.first.url).to include('http://www.makersacademy.com')
      expect(bookmarkstest.first.id).to eq bookmarktest.id


    end 

  end 

  describe '.add_bookmark' do 

    it 'can add a bookmark' do 

      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.add_bookmark(url: "http://www.github.com", title: "github")
      expect(bookmark.title).to include('github')
      expect(bookmark.url).to include('http://www.github.com')

    end 

  end 

end 

