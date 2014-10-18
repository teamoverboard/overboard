class Answer < ActiveRecord::Base
	has_many :votes, :as => :voteable
  belongs_to :question
  belongs_to :user
end
