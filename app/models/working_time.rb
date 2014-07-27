class WorkingTime
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :from, type: Time
  field :to, type: Time
  field :duration, type: Float
  field :description, type: String
  belongs_to :customer
  belongs_to :bill

  validates_presence_of :title
  validates_presence_of :from
  validates_presence_of :to

  before_save :calculate_duration

  private
  def calculate_duration
    self.duration = ((self.to - self.from) / 60).round(2)
  end
end
