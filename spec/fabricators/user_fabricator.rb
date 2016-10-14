Fabricator(:user) do
  full_name { Faker::Lorem.name }
  email { Faker::Internet.email }
  password { "password" }
end
