class Diary < ActiveRecord::Base
  belongs_to :user
  belongs_to :cat
  validates :mood, presence: true
  validates :behavior, presence: true
  validates :date, presence: true
end
