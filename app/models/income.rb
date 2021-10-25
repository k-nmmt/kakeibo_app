class Income < ApplicationRecord
    belongs_to :saving
    belongs_to :user

    validates :income_amount, presence: true, length: { maximum: 100 }
    validates :saving_id, presence: true
    validates :income_date, presence: true

    def self.search(income_date)
        where(["income_date", "%#{income_date}%"])
      end


    def income_date_month
        income_date.strftime("%Y年%-m月")
      end
end
