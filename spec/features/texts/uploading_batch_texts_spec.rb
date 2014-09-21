feature 'Uploading texts' do
  background do
    @company = create(:company)
    @user = create(:user, company: @company)
    signin(@user.email, @user.password)
  end

  scenario 'On the company page there is a link to upload texts', js: true do
    visit "/companies/#{@company.id}/dashboard"

    expect(page).to have_content 'Create a new project'
  end 
end
