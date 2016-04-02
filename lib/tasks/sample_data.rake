namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    # make_posts
  end
end

def make_users
  admin = User.create!(email:    "john45@mail.ru",
                       password: "12345678",
                       password_confirmation: "12345678")
  99.times do |n|
    name  = Faker::Name.name
    email = "test_mail#{n}@mangamen.com"
    password  = "password"
    User.create!(email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_posts
  users = User.limit(10)
  50.times do
    content = Faker::Lorem.sentence(4)
    users.each { |user| user.posts.create!(message: content) }
  end
end