class Poly1 < ApplicationRecord
    has_many :relates, as: :relatable
end
