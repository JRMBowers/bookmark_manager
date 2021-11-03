require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.add_bookmark(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.add_bookmark(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.add_bookmark(url: "http://www.google.com", title: "Google")
  
    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href:'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software', href:'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href:'http://www.google.com')
  end
end

feature 'Adding bookmarks' do 
  scenario 'As a user I can add a bookmark and a title' do 
    visit("/bookmarks")
    click_on('Add New Bookmark')
    fill_in('bookmark', with: 'http://www.makersacademy.com' )
    fill_in('title', with: 'MakersAcademy' )
    click_on('Submit Bookmark')
    expect(page).to have_link('MakersAcademy', href:'http://www.makersacademy.com')
  end 
end 
