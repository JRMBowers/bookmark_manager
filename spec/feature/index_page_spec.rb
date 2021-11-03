feature 'index page' do 
  
  scenario 'User can see bookmarks stored' do 
    visit('/bookmarks')
    expect(page).to have_content ""
  end 


end 

feature 'Bookmark functionality' do 

  scenario 'User can delete a bookmark' do 
    add_bookmarks
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks' 
    expect(page).to_not have_link('MakersAcademy', href: 'http://www.makersacademy.com')
  end 

end 