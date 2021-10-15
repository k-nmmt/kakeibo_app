class Expend < ApplicationRecord
    belongs_to :saving
    
    validates :expend_amount, presence: true, length: { maximum: 100 }
end
