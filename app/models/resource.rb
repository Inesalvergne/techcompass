class Resource < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_author,
                  against: %i[title level tags],
                  associated_against: {
                    user: %i[full_name job_title]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  belongs_to :user
  has_rich_text :rich_content

  validates :title, :summary, :rich_content, :level, :tags, presence: true
end
