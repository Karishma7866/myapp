class Profile < ApplicationRecord
    belongs_to :user
    validates_presence_of :address  
    #validates_length_of :phone_number, maximum:10, minimum:10
    validates_presence_of :city
    validates_presence_of :state 
    validates_presence_of :country
    validates_uniqueness_of :user_id 
    

    
end
