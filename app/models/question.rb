class Question < ActiveRecord::Base
  include PgSearch

	has_many :answers
	has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable
  belongs_to :user
  belongs_to :channel

	validates :title, presence: true

  pg_search_scope :search, :against => [ :title, :description ]
end
