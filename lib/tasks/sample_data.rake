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
    50.times do |n|
      title = Faker::Name.name
      content = Faker::Lorem.paragraph
      author = Faker::Name.name
      tweet = Faker::Lorem.sentence(1)
      tags = Faker::Lorem.sentence 
      verse = Faker::Lorem.sentence
      translation = Faker::Lorem.sentence
      published_at = Time.now
      Micropost.create(title: title, content: content, author: author,
        tweet: tweet, tags: tags, verse: verse, translation: translation,
        published_at: published_at)
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
