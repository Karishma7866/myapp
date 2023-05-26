class Poly3 < ApplicationRecord
    has_many :relates, as: :relatable
end
