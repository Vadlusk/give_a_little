def fill_in_credentials(email, password)
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_on 'Log In'
end
