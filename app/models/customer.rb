class Customer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name, type: String
  field :billing_number, type: Integer
  field :email, type: String
  field :phone_no, type: String
  field :city, type: String
  field :adress, type: String

  validates_presence_of :billing_number
  validates_uniqueness_of :billing_number
  index({ billing_number: 1 }, { unique: true })
  slug  :billing_number, :history => false
end
