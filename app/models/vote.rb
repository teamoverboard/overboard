class Vote < ActiveRecord::Base
	belongs_to :voteable, polymorphic: true, counter_cache: true
	validates :user_id, uniqueness: { scope: [ :voteable_id, :voteable_type ] }
end
