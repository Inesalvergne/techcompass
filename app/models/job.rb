class Job < ApplicationRecord
  belongs_to :goal
  has_one :user, through: :goal

  validates :company, :description, :location, :role, :level, :post_url, :status, presence: true
end
