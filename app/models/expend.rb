class Expend < ApplicationRecord
    validates :expend_amount, presence: true, length: { maximum: 100 }
end
