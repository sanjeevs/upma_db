namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Upanishad.create(name: "ExampleBook")
    99.times do |n|
      name = Faker::Name.name
      Upanishad.create!(name: name)
    end
  end
end
