FactoryGirl.define do
  factory :offer do
    offer_id "A123"
    latitude 41.112469
    longitude -1.186523
    title "Nice apartment"
    city "Barcelona"
    suburb "Village"
    whole_apartment false
    instant_booking true
    reviews 25
    price 43.50
    on_wimdu true
    wimdu_code "4VCJ961L"
    comment "Test comment"
  end
end
