class Expend < ApplicationRecord
    belongs_to :saving
    belongs_to :user
    
    validates :expend_amount, presence: true, length: { maximum: 100 }
    validates :saving_id, presence: true
end
