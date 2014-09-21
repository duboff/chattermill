# Feature: User profile page
#   As a user
#   I want to visit my user profile page
#   So I can see my personal account data
feature 'User profile page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User sees own profile
  #   Given I am signed in
  #   When I visit the user profile page
  #   Then I see my own email address
  scenario 'user sees own profile', js: true do
    user = create(:user)
    login_as(user, scope: :user)
    visit "/users/#{user.id}"
    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_name
    expect(page).to have_content user.email
  end

  scenario 'user sees his own company in profile', js: true do
    company = create(:company) 
    user = create(:user, company: company)
   
    login_as(user, scope: :user)
    visit "/users/#{user.id}"

    expect(page).to have_content company.name
  end

  # Scenario: User cannot see another user's profile
  #   Given I am signed in
  #   When I visit another user's profile
  #   Then I see an 'access denied' message
  # scenario "user cannot see another user's profile", js: true do
  #   me = FactoryGirl.create(:user)
  #   other = FactoryGirl.create(:user, email: 'other@example.com')
  #   login_as(me, :scope => :user)
  #   visit "/users/#{other.id}"

  #   expect(page).to have_content 'Access denied.'
  # end

end
