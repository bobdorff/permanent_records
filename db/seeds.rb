#User.create!(username: 'rando_calrissian',  
             #email:    'exampleemail@fake.com',
             #password:              'password',
             #password_confirmation: 'password'
            #)

99.times do |n|
  username  = "#{Faker::Internet.user_name}" + "#{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username:              username,
               email:                 email,
               password:              password,
               password_confirmation: password)
end
