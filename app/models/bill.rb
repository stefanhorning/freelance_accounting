class Bill
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  auto_increment :bill_id
  field :time_amount, type: Float
  field :price_amount, type: Float
  field :paid, type: Boolean
  field :items, type: Array
  belongs_to :customer
  has_many :working_times

  validates_presence_of :customer
  validates_uniqueness_of :bill_id, :scope => :customer
  index({ bill_id: 1 }, { unique: true })
  slug  :bill_id, :history => false
end
