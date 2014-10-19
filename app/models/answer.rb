class Answer < ActiveRecord::Base
	has_many :votes, :as => :voteable
  belongs_to :question
  belongs_to :user
  delegate :name, :id, to: :user, prefix: true
  delegate :title, to: :question
end
