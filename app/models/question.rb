class Question < ActiveRecord::Base
	has_many :answers
	has_many :votes, :as => :voteable
  belongs_to :user

  delegate :name, to: :user, prefix: true

	validates :title, presence: true
end
