FactoryGirl.define do
  factory :site do
    name "accomodation_site"
    last_updated Date.parse('2013-06-10')
    search_base_url "http://xyz.de/search"
    offer_base_url "http://xyz.de/offer"
    profile_base_url "http://xyz.de/user"
  end
end
