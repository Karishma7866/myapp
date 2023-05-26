class Poly2 < ApplicationRecord
    has_many :relates, as: :relatable
end
