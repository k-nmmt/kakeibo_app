class Income < ApplicationRecord
    belongs_to :saving
    belongs_to :user

    validates :income_amount, presence: true, length: { maximum: 100 }
end
