class Book < ApplicationRecord
    #associations
    #validations
    belongs_to :user

    #callbacks
    after_create :update_status
    def update_status
        update_columns(status: "draft")
    end
end
