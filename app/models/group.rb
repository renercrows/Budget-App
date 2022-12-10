class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true, length: { maximum: 250 }

  belongs_to :user
  has_many :entities, dependent: :delete_all
end
