# Feature: User profile page
#   As a user
#   I want to visit my user profile page
#   So I can see my personal account data
feature 'User profile page' do
  background do
    @user = create(:user)
    signin(@user.email, @user.password)
    visit "/users/#{@user.id}"
  end
  # Scenario: User sees own profile
  #   Given I am signed in
  #   When I visit the user profile page
  #   Then I see my own email address
  scenario 'user sees own profile', js: true do
    expect(page).to have_content @user.first_name
    expect(page).to have_content @user.last_name
    expect(page).to have_content @user.email
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
