def fill_in_login_info(email, password)
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_on 'Log In'
end
