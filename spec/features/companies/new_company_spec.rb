feature 'Company' do
  
  scenario 'user sees a link to create a new company in profile if one does not exist', js: true do 
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)

    click_link 'Create company'

    expect(page).to have_content 'New Company'
  end

  scenario 'can create a new company', js: true do
    visit "/companies/new"

    fill_in 'Company Name', with: "Acme"
    fill_in 'Website', with: "http://www.acme.org"
    click_button 'Create Company'

    expect(page).to have_content 'Acme'
    expect(current_path).to eq '/companies/1'
  end
end