module ValidUserRequestHelper
  # Define a method which signs in as a valid user.
  def sign_in_as_a_valid_user
      @user ||= create(:user)
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
  end
end