FactoryGirl.define do
  factory :host do
    name "Marc Smith"
    email "test@test.de"
    host_id "A1234567"
    comment "A nice little comment"
    telephone "+4930 0323 23"
    website "http://website.com"
    city "New York"
    country "United States"
    reviews 15
    superhost true
    wimdu_host_id "QA2GB2"
    failed_research true
  end
end
