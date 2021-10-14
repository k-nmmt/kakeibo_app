class Income < ApplicationRecord
    validates :income_amount, presence: true, length: { maximum: 100 }
end
