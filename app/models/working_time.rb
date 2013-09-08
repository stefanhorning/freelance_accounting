class WorkingTime
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :from, type: Time
  field :to, type: Time
  field :description, type: String
  belongs_to :customer

  validates_presence_of :title
end
