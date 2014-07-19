namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Upanishad.create(name: "ExampleBook")
    107.times do |n|
      name = Faker::Name.name
      Upanishad.create!(name: name)
    end
    upanishads = Upanishad.all(limit: 6)
    50.times do
      content =  Faker::Lorem.sentence(40)
      upanishads.each { |upanishad| upanishad.verses.create!(content: content) }
    end
  end
end
