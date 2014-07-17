FactoryGirl.define do
  factory :upanishad do
    sequence(:name) { |n| "Book #{n}" }
  end

  factory :verse do
    content "Lorem ipsum"
    upanishad
  end
end
