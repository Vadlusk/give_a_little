def stub_google_omniauth
  # first, set OmniAuth to run in test mode
  OmniAuth.config.test_mode = true
  # then, provide a set of fake oauth data that
  # omniauth will use when a user tries to authenticate:
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({"provider"=>"google_oauth2",
 "uid"=>"116073257923801628545",
 "info"=>
  {"name"=>"Valane Adam Lusk",
   "email"=>"adlusk@gmail.com",
   "first_name"=>"Adam",
   "last_name"=>"Lusk",
   "image"=>"https://lh4.googleusercontent.com/-w4ZHEFr1kpY/AAAAAAAAAAI/AAAAAAAAADU/LsbvgKio0Ms/photo.jpg",
   "urls"=>{"Google"=>"https://plus.google.com/116073257923801628545"}},
 "credentials"=>
  {"token"=>
    "ya29.GlvaBRVJpRKd4oZ-0CShD_4Hl3JmZiXVOUygEeOHRS4VqsUyPLvPrjmNG2BQNKvW0SCj_YSb4l9TFKyBI2oSaZAbifGoQUYwiwHQ5apkA5FtjrU3UUUePPZuGIRm",
   "expires_at"=>1529001640,
   "expires"=>true},
 "extra"=>
  {"id_token"=>
    "eyJhbGciOiJSUzI1NiIsImtpZCI6IjdkZGY1NGQzMDMyZDFmMGQ0OGMzNjE4ODkyY2E3NGMxYWMzMGFkNzcifQ.eyJhenAiOiI5OTI0OTM3NTM3NzMtcnYzbDhqbHQ4MnA5azdhcjYyNHJwYWU5YTJ0ZGxkbHQuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI5OTI0OTM3NTM3NzMtcnYzbDhqbHQ4MnA5azdhcjYyNHJwYWU5YTJ0ZGxkbHQuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTYwNzMyNTc5MjM4MDE2Mjg1NDUiLCJlbWFpbCI6ImFkbHVza0BnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6InNtT0F2YlB0U29LaTAzMVVQc0ZXa1EiLCJleHAiOjE1MjkwMDE2NDAsImlzcyI6ImFjY291bnRzLmdvb2dsZS5jb20iLCJpYXQiOjE1Mjg5OTgwNDB9.fMSosvmoF6YW2ThCZXtSpRAfgtQjXPcZ_gfTXXYNRuivGoi1BQbie5MnI24NhY4Jbfwb42N09lcvVldFZa20I2eHbT0tmi75l5gd0F8Ii4kSzSs0dLsyQJImE2hcs0-lT_OtoQeuvKoYW7Se0bJXmYJuHJFN8l9ioONnDllotskgl7nbMDPok0WHDgajHjI3jIwEwTGMWxnkAOL1qDHfJG2GTzbW-A7ZkEUQdnfx9b7qAA1P_k6Q48gs4YCzyWzF_JlafBv9nebSXWGX0ast_LHMMiZE__BP_Qsg8jZDqqZytoZSEstsugVo1mEODurrnn5h-5YkB9vLnkCRELSkuA",
   "id_info"=>
    {"azp"=>"992493753773-rv3l8jlt82p9k7ar624rpae9a2tdldlt.apps.googleusercontent.com",
     "aud"=>"992493753773-rv3l8jlt82p9k7ar624rpae9a2tdldlt.apps.googleusercontent.com",
     "sub"=>"116073257923801628545",
     "email"=>"adlusk@gmail.com",
     "email_verified"=>true,
     "at_hash"=>"smOAvbPtSoKi031UPsFWkQ",
     "exp"=>1529001640,
     "iss"=>"accounts.google.com",
     "iat"=>1528998040},
   "raw_info"=>
    {"kind"=>"plus#personOpenIdConnect",
     "gender"=>"male",
     "sub"=>"116073257923801628545",
     "name"=>"Adam Lusk",
     "given_name"=>"Adam",
     "family_name"=>"Lusk",
     "profile"=>"https://plus.google.com/116073257923801628545",
     "picture"=>"https://lh4.googleusercontent.com/-w4ZHEFr1kpY/AAAAAAAAAAI/AAAAAAAAADU/LsbvgKio0Ms/photo.jpg?sz=50",
     "email"=>"adlusk@gmail.com",
     "email_verified"=>"true",
     "locale"=>"en"}}})
end
