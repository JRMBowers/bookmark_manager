feature 'index page' do 
  
  scenario 'User can see bookmarks stored' do 
    visit('/bookmarks')
    expect(page).to have_content ""
  end 

end 