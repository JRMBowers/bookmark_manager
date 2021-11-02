feature 'index page' do 
  
  scenario 'User can see bookmarks stored' do 
    visit('/bookmarks')
    expect(page).to have_content "http://makersacademy.com http://www.google.com http://www.destroyallsoftware.com"
  end 

end 