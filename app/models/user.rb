class User < ActiveRecord::Base
    has_secure_password
    validates :email, presence: true, uniqueness: true
    has_many :cats
    has_many :diaries
end
