feature 'Creating projects', :vcr do
  background do
    allow_any_instance_of(Text).to receive(:process_text).and_return true
    @company = create(:company)
    @user = create(:user, company: @company)
    signin(@user.email, @user.password)
  end

  scenario 'On the company page there is a link to upload texts', js: true do
    visit "/companies/#{@company.id}/dashboard"
    
    expect(page).to have_content 'Create a new project'
  end

  scenario 'User fills in the form and is redirected to the project page', js: true do
    visit "/companies/#{@company.id}/dashboard"
    click_link 'Create a new project'

    fill_in "Project Name", with: 'My awesome project'
    fill_in 'Project Body', with: 'bla bla'
    click_button 'Create Project'

    expect(page).to have_content 'My awesome project'
  end
end
