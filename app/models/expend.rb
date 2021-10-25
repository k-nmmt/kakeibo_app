class Expend < ApplicationRecord
    belongs_to :saving
    belongs_to :user
    
    validates :expend_amount, presence: true, length: { maximum: 100 }
    validates :saving_id, presence: true
    validates :expend_date, presence: true

    def self.search(expend_date)
        where(["expend_date", "%#{expend_date}%"])
      end
    
    def expend_date_month
      expend_date.strftime("%Y年%-m月")
    end
end
