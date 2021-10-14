class Saving < ApplicationRecord
    belongs_to :user


    validates :saving_name, presence: true, length: { maximum: 100 }
end
