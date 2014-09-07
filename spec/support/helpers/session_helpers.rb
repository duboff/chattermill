module Features
  module SessionHelpers
    def sign_up_with(email, password, confirmation)
      visit new_user_registration_path
      fill_in 'First Name', with: 'James'
      fill_in 'Last Name', with: 'Bond'
      fill_in 'Email Address', with: email
      fill_in 'Password', with: password
      fill_in 'Confirm Password', :with => confirmation
      click_button "t_and_c_agree"
      click_button 'Register'
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in 'Email Address', with: email
      fill_in 'Password', with: password
      click_button 'Sign In'
    end
  end
end
