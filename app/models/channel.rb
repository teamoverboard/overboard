class Channel < ActiveRecord::Base
  has_many :questions

  def self.find_or_create(channel_name)
    where(name: channel_name).first_or_create!
  end
end
