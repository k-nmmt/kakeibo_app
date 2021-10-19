class Expend < ApplicationRecord
    belongs_to :saving
    belongs_to :user
    
    validates :expend_amount, presence: true, length: { maximum: 100 }
    validates :saving_id, presence: true

    def self.search(expend_date)
        where(["expend_date", "%#{expend_date}%"])
      end
end
