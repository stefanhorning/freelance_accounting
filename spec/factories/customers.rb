FactoryGirl.define do
  factory :customer do
    name "Big Corporation"
    person_name "Hans Meier"
    billing_number 1
    hourly_rate 30.5
    email "hans@big-coporation.com"
    phone_no "234 234234234"
    zipcode "12312"
    city "Berlin"
    address "Lustigestr. 123"
  end
end
