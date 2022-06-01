class Goal < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy

  validates :job_target, numericality: { greater_than: 0, less_than: 999_999_999, only_integer: true }, presence: true
  validates :description, presence: true
end
