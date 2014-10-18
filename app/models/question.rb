class Question < ActiveRecord::Base
  include PgSearch

	has_many :answers
	has_many :votes, :as => :voteable
  belongs_to :user

  delegate :name, to: :user, prefix: true

	validates :title, presence: true

  pg_search_scope :search, :against => [ :title, :description ]
end
