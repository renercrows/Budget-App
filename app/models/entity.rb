class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :amount, presence: true
  validates :name, presence: true, length: { maximum: 50 }
end
