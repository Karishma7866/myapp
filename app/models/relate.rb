class Relate < ApplicationRecord
    belongs_to :relatable, polymorphic: true
end
