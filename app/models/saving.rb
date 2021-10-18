class Saving < ApplicationRecord
    belongs_to :user


    validates :saving_name, presence: true, length: { maximum: 100 }

    has_many :incomes, dependent: :destroy
    has_many :expends, dependent: :destroy
   # accepts_nested_attributes_for :incomes, allow_destroy: true
end
