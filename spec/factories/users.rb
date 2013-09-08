FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password 'A1234567'
    password_confirmation 'A1234567'
    role 'admin'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
