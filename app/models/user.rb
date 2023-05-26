class User < ApplicationRecord
    #model me validations and association add karte hai
    has_one :profile
    has_many :books
    has_many :orders
    validates :email, uniqueness: true
end
