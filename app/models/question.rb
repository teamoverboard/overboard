class Question < ActiveRecord::Base
	has_many :answers
	has_many :votes, :as => :voteable
	validates :title, presence: true
  belongs_to :user
end
