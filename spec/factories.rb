FactoryGirl.define do
  factory :upanishad do
    sequence(:name) { |n| "Book #{n}" }
  end

  factory :verse do
    content "Lorem ipsum"
    english "translate the upanishads"
    upanishad
  end

  factory :user do
    sequence(:name) { |n| "Person#{n}" }
    sequence(:email) { |n| "person_#{n}@example.org" }
    password "foobar"
    password_confirmation "foobar"
    factory :admin do
      admin true
    end
  end
  factory :micropost do
    content "Lorem ipsum"
    title "dummy title"
    author "anonymous"
    urn "verse:0"
  end
end
