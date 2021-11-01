feature 'index page' do 

  scenario 'checks page loads' do 
    visit('/')
    expect(page).to have_content "Hello World"
  end 

end 