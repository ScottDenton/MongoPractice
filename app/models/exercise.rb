class Exercise
  include Mongoid::Document
  field :name, type: String
  field :weight, type: Integer
  field :reps, type: Integer
  field :sets, type: Integer
  belongs_to :workout
  belongs_to :user
end
