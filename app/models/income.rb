class Income < ApplicationRecord
    belongs_to :saving

    validates :income_amount, presence: true, length: { maximum: 100 }
end
