class Workout
  include Mongoid::Document
  field :name, type: String
  field :created_at, type: DateTime
  belongs_to :user
  has_many :exercises
end
