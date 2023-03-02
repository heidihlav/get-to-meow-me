class Cat < ActiveRecord::Base
  belongs_to :user
  has_many :diaries

end
