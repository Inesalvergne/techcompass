class Job < ApplicationRecord
  belongs_to :goal
  has_one :user, through: :goal

  ROLE = ['Back-End Developer', 'Front-End Developer',
          'Full-Stack Developer'].freeze
  LEVEL = ['Entry Level', 'Junior', 'Senior'].freeze
  STATUS = ['Wishlist', 'Applied', 'Interview', 'Decision', 'Offer',
            'Rejected'].freeze

  validates :company, :description, :location, presence: true
  validates :role, presence: true, inclusion: { in: ROLE }
  validates :level, presence: true, inclusion: { in: LEVEL }
  validates :status, presence: true, inclusion: { in: STATUS }
end
