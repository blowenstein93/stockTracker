class User < ActiveRecord::Base
    validates :email, uniqueness: true
    validates :phone, uniqueness: true
    validates :email, presence: true
    validates :phone, presence: true
end
