class Resource < ApplicationRecord
  include PgSearch::Model

  TAGS = ['Back-End Developer', 'Front-End Developer',
    'Full-Stack Developer', 'Digital Marketer', 'Data Scientist',
    'Data Analyst', 'Product Manager'].freeze
  LEVEL = ['Entry-Level', 'Junior', 'Intermediate', 'Senior', 'Manager'].freeze

  pg_search_scope :search_by_title_and_author,
                  against: %i[title tags],
                  # associated_against: {
                  #   user: %i[full_name job_title]
                  # },
                  using: {
                    tsearch: { prefix: true }
                  }

  belongs_to :user
  has_many :views, dependent: :destroy
  has_rich_text :rich_content
  validates :title, :summary, :level, :tags, presence: true
  has_one_attached :image


end
