def stub_twitter_omniauth
  # first, set OmniAuth to run in test mode
  OmniAuth.config.test_mode = true
  # then, provide a set of fake oauth data that
  # omniauth will use when a user tries to authenticate:
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
    {"provider"=>"twitter",
     "uid"=>"521705477",
     "info"=>
     {"nickname"=>"ValaneAdamLusk",
      "name"=>"Valane Adam Lusk",
      "email"=>"AdLusk@gmail.com",
      "location"=>"Centennial, CO",
      "image"=>"http://pbs.twimg.com/profile_images/969056109209137152/1JPWgjc8_normal.jpg",
      "description"=>"I play bassoon. I also program. Currently a student at https://t.co/TrJ7G88hmO, in Denver, CO. Learning Ruby on Rails.",
      "urls"=>{"Website"=>"https://t.co/05dGIF1aQd", "Twitter"=>"https://twitter.com/ValaneAdamLusk"}},
      "credentials"=>{"token"=>"521705477-4XK0HRr29ZtedBCnWZtDrnQxqtuoyNu1JmFnjEei", "secret"=>"srojeSFsgUElq60cpg7Zw6jxZzrOQVUgCfvSy7do3KIH5"}
     }
   )
end
