FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

<<<<<<< HEAD
     factory :admin do
=======
    factory :admin do
>>>>>>> upto-f-f
      admin true
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end
end