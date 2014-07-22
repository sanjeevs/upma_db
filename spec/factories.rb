FactoryGirl.define do
  factory :upanishad do
    sequence(:name) { |n| "Book #{n}" }
  end

  factory :verse do
    content "Lorem ipsum"
    upanishad
  end

  factory :user do
    name "Sanjeev Singh"
    email "sanjeev@example.org"
    password "foobar"
    password_confirmation "foobar"
 end
end
