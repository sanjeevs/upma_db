namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create(name: 'Example User',
                        email: 'example@a.org',
                        password: 'foobar',
                        password_confirmation: 'foobar')
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n + 1}@railstutorial.org"
      password = 'password'
      User.create(name: name, email: email, password: password, 
        password_confirmation: password)
    end
    Upanishad.create(name: "ExampleBook")
    107.times do |n|
      name = Faker::Name.name
      Upanishad.create!(name: name)
    end
    upanishads = Upanishad.all(limit: 6)
    50.times do |n|
      content =  Faker::Lorem.sentence(40)
      upanishads.each { |upanishad| upanishad.verses.create!(content: content, position: n) }
    end
  end
end
